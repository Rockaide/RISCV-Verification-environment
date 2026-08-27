#include <iostream>
#include <vector>
#include <string>
#include <iomanip>

// Xcelium DPI-C standard header
#include "svdpi.h"

// Spike Simulator Headers 
#include "riscv/debug_module.h"
#include "riscv/sim.h"
#include "riscv/processor.h"
#include "riscv/mmu.h"
#include "riscv/cfg.h"
#include "riscv/Params.h"
#include "riscv/csrs.h"

class cv32e40p_dcsr_t : public dcsr_csr_t {
public:
    cv32e40p_dcsr_t(processor_t* const proc, const reg_t addr) : dcsr_csr_t(proc, addr) {}
    bool unlogged_write(const reg_t val) noexcept override {
        reg_t current = read();
        // Writable bits in CV32E40P: ebreakm(15), ebreaku(12), stepie(11), step(2), prv(1:0)
        reg_t mask = 0x9807; 
        reg_t new_val = (current & ~mask) | (val & mask);
        return dcsr_csr_t::unlogged_write(new_val);
    }
};

class cv32e40p_mtvec_t : public tvec_csr_t {
public:
    cv32e40p_mtvec_t(processor_t* const proc, const reg_t addr) : tvec_csr_t(proc, addr) {}
    bool unlogged_write(const reg_t val) noexcept override {
        // CV32E40P hardware restricts mtvec to 256-byte aligned base addresses.
        // Bits 31:8 are RW for BASE. Bit 0 is RW for MODE.
        // Bits 7:1 are hardwired to 0.
        reg_t mask = 0xFFFFFF01;
        reg_t new_val = val & mask;
        return tvec_csr_t::unlogged_write(new_val);
    }
};

class cv32e40p_mie_t : public mie_csr_t {
public:
    cv32e40p_mie_t(processor_t* const proc, const reg_t addr) : mie_csr_t(proc, addr) {}
    reg_t write_mask() const noexcept override {
        // CV32E40P uses [31:16] for custom fast interrupts.
        // It is strictly an M-mode core, so we also allow standard MSIP (3), MTIP (7), and MEIP (11).
        // 0x0888 = (1<<11) | (1<<7) | (1<<3).
        return 0xFFFF0888;
    }
};

class cv32e40p_mip_t : public mip_csr_t {
public:
    cv32e40p_mip_t(processor_t* const proc, const reg_t addr) : mip_csr_t(proc, addr) {}
    reg_t write_mask() const noexcept override {
        // In CV32E40P, the entire mip register is read-only from software 
        // (it is driven directly by the hardware interrupt pins).
        // Spike's testbench will use backdoor_write_with_mask() to inject interrupts.
        return 0;
    }
};

// Global flags to track CV32E40P configuration based on the ISA string passed by the testbench
bool cv32_has_u = false;
bool cv32_has_f = false;
bool cv32_has_zfinx = false;

/*
 * cv32e40p_mstatus_proxy_t
 * 
 * Why this is needed:
 * Spike natively enables bits in the mstatus register based on its internal ISA 
 * parser (which can automatically enable User/Supervisor extensions by default, 
 * unmasking fields like MPRV). However, CV32E40P restricts writable mstatus fields 
 * based on specific RTL parameters (PULP_SECURE for User Mode, and FPU). Allowing 
 * Spike to handle mstatus organically causes lockstep mismatches on CSR writes.
 * 
 * Why it's done this way:
 * To avoid modifying Spike's base code, we use Spike's proxy_csr_t to intercept 
 * mstatus reads and writes. To perfectly match the RTL, we bypass Spike's internal 
 * extension logic, and explicitly parse the ISA string passed by the testbench 
 * (captured in cv32_has_u, cv32_has_f) to mask bits strictly according to the CV32E40P manual.
 */
class cv32e40p_mstatus_proxy_t : public proxy_csr_t {
    processor_t* proc_ptr;
public:
    cv32e40p_mstatus_proxy_t(processor_t* const proc, const reg_t addr, csr_t_p delegate) 
        : proxy_csr_t(proc, addr, delegate), proc_ptr(proc) {}

    reg_t read() const noexcept override {
        reg_t val = proxy_csr_t::read();
        
        // Base mask: MPIE (7), MIE (3) -> 0x0088
        reg_t mask = 0x00000088;
        
        if (cv32_has_u) {
            // If User mode is enabled (PULP_SECURE=1), these fields become RW
            // MPRV (17), MPP (12:11), UPIE (4), UIE (0)
            mask |= 0x00021811;
        }
        
        // Add FS (14:13) only if FPU is enabled and ZFINX is disabled
        if (cv32_has_f && !cv32_has_zfinx) {
            mask |= 0x00006000;
        }
        
        reg_t new_val = val & mask;
        
        // MPP (12:11) is hardwired to 3 (Machine mode) ONLY if User mode is disabled
        if (!cv32_has_u) {
            new_val |= 0x00001800;
        }
        
        // Debug logging (commented out for production):
        // std::cout << "[DPI-C] mstatus proxy read: has_u=" << cv32_has_u 
        //           << ", has_f=" << cv32_has_f 
        //           << ", val=0x" << std::hex << val 
        //           << ", mask=0x" << mask 
        //           << ", new_val=0x" << new_val << std::dec << std::endl;
                  
        return new_val;
    }

protected:
    bool unlogged_write(const reg_t val) noexcept override {
        reg_t current = proxy_csr_t::read();
        
        // Base mask: MPIE (7), MIE (3) -> 0x0088
        reg_t mask = 0x00000088;
        
        if (cv32_has_u) {
            // If User mode is enabled, these fields become RW
            mask |= 0x00021811;
        }
        
        // Add FS (14:13) only if FPU is enabled and ZFINX is disabled
        if (cv32_has_f && !cv32_has_zfinx) {
            mask |= 0x00006000;
        }
        
        reg_t new_val = (current & ~mask) | (val & mask);
        
        // Force MPP to 3 ONLY if User mode is disabled
        if (!cv32_has_u) {
            new_val = (new_val & ~0x00001800) | 0x00001800;
        }
        
        // Debug logging (commented out for production):
        // std::cout << "[DPI-C] mstatus proxy unlogged_write: has_u=" << cv32_has_u 
        //           << ", has_f=" << cv32_has_f 
        //           << ", current=0x" << std::hex << current 
        //           << ", val_to_write=0x" << val 
        //           << ", mask=0x" << mask 
        //           << ", new_val=0x" << new_val << std::dec << std::endl;
        
        return proxy_csr_t::unlogged_write(new_val);
    }
};

class custom_trap_t : public trap_t {
    reg_t tval;
public:
    custom_trap_t(reg_t cause, reg_t tval) : trap_t(cause), tval(tval) {}
    bool has_tval() override { return true; }
    reg_t get_tval() override { return tval; }
};
#include <fstream>
#include <sstream>
#include "vpi_user.h"

// Global pointers to hold the Spike simulation instance and configuration
sim_t* spike_sim = nullptr;
processor_t* spike_core = nullptr;
cfg_t* spike_cfg = nullptr;
uint32_t spike_retired_pc = 0;
uint32_t write_tohost_addr = 0;

extern "C" {

    // -------------------------------------------------------------------------
    // 1. Initialization
    // -------------------------------------------------------------------------
    void rvviRefInit(const char* isa, const char* elf_file, const char* nm_file) {
        std::cout << "[DPI-C] Initializing Spike Reference Model..." << std::endl;
        
        // Parse nm_file to find write_tohost if provided
        if (nm_file && nm_file[0] != '\0') {
            std::ifstream nm_stream(nm_file);
            std::string line;
            while (std::getline(nm_stream, line)) {
                // Line format typically: <address> <type> <symbol_name>
                std::istringstream iss(line);
                std::string addr_str, type_str, sym_name;
                if (iss >> addr_str >> type_str >> sym_name) {
                    if (sym_name == "write_tohost") {
                        write_tohost_addr = std::stoul(addr_str, nullptr, 16);
                        std::cout << "[DPI-C] Found write_tohost at 0x" << std::hex << write_tohost_addr << std::endl;
                    }
                }
            }
        }
        
        // Fallback: If nm_file was missing or failed, run nm directly on the ELF file
        if (write_tohost_addr == 0 && elf_file) {
            char cmd[1024];
            snprintf(cmd, sizeof(cmd), "/home/rocca/tools/corev/corev-openhw-gcc-rocky8-20240530/bin/riscv32-corev-elf-nm %s", elf_file);
            FILE* fp = popen(cmd, "r");
            if (fp) {
                char line[512];
                while (fgets(line, sizeof(line), fp)) {
                    std::istringstream iss(line);
                    std::string addr_str, type_str, sym_name;
                    if (iss >> addr_str >> type_str >> sym_name) {
                        if (sym_name == "write_tohost") {
                            write_tohost_addr = std::stoul(addr_str, nullptr, 16);
                            std::cout << "[DPI-C] Found write_tohost (via riscv32-corev-elf-nm) at 0x" << std::hex << write_tohost_addr << std::endl;
                            break;
                        }
                    }
                }
                pclose(fp);
            }
        }

        // Target CV32E40P capabilities
        std::string target_isa = isa ? isa : "RV32IMFC";
        
        cv32_has_u = (target_isa.find('U') != std::string::npos || target_isa.find('u') != std::string::npos);
        cv32_has_f = (target_isa.find('F') != std::string::npos || target_isa.find('f') != std::string::npos);
        cv32_has_zfinx = (target_isa.find("zfinx") != std::string::npos || target_isa.find("Zfinx") != std::string::npos);

        // CV32E40P supports Zifencei, but Spike's ISA parser doesn't
        // automatically enable it for RV32IMC, so we append it explicitly.
        if (target_isa.find("zifencei") == std::string::npos && 
            target_isa.find("Zifencei") == std::string::npos) {
            target_isa += "_zifencei";
        }
        
        // Configure Spike memory: cover up to 0x21000000 to include test_ret_val at 0x20000000
        std::vector<mem_cfg_t> mem_layout;
        mem_layout.push_back(mem_cfg_t(0x00000000, 0x21000000));
        mem_layout.push_back(mem_cfg_t(0x1A111000, 0x10000));
        std::vector<size_t> hartids = {0}; // 1 hart with ID 0
        spike_cfg = new cfg_t(
            std::make_pair((reg_t)0, (reg_t)0), // default_initrd_bounds
            nullptr,                            // default_bootargs
            target_isa.c_str(),                 // default_isa
            "M",                                // default_priv
            "vlen:128,elen:64",                 // default_varch
            false,                              // default_misaligned
            endianness_little,                  // default_endianness
            16,                                 // default_pmpregions
            mem_layout,                         // default_mem_layout
            hartids,                            // default_hartids
            false,                              // default_real_time_clint
            4                                   // default_trigger_count
        );
        
        // Pass the compiled ELF file to Spike so it loads the identical memory image
        std::vector<std::string> args;
        if (elf_file) {
            args.push_back(elf_file);
        } else {
            std::cerr << "[DPI-C] Error: No ELF file provided for Spike initialization." << std::endl;
        }
        
        // Setup modern Spike sim_t arguments
        std::vector<std::pair<reg_t, mem_t*>> mems;
        mems.push_back(std::make_pair(0x00000000, new mem_t(0x20000000)));
        mems.push_back(std::make_pair(0x20000000, new mem_t(0x01000000)));
        // Spike's bus_t resolves accesses using upper_bound(). It routes accesses after 
        // 0x1A110000 to the 4KB debug_module, inadvertently hiding the RAM mapped at 0x0.
        // We explicitly map the 0x1A111000 region so bus_t properly resolves the .debugger_exception section.
        mems.push_back(std::make_pair(0x1A111000, new mem_t(0x10000)));
        std::vector<std::pair<reg_t, abstract_device_t*>> plugin_devices;
        debug_module_config_t dmc; 
        openhw::Params params;
        
        // Instantiate the simulator with the 12-argument constructor
        spike_sim = new sim_t(
            spike_cfg,            // cfg_t configuration
            false,                // halted on reset
            mems,                 // physical memory regions
            plugin_devices,       // plugin devices
            args,                 // executable and arguments
            dmc,                  // debug module configuration
            "spike_log",          // log path
            false,                // dtb_enabled (typically false for bare-metal DV)
            nullptr,              // dtb_file
            false,                // socket_enabled
            nullptr,              // cmd_file
            params                // openhw::Params
        );
        
        //Enables the trace log for Spike
        spike_sim->configure_log(true, true);
                              
        // Extract hart 0 (the primary core)
        spike_core = spike_sim->get_core(0);
        
        // Enable disassembly in the log
        spike_core->set_debug(true);
        
        // Start the simulator to load the ELF via htif_t
        spike_sim->start();
        
        // Reset the processor to ensure deterministic state at time 0
        spike_core->reset();
        
        // Use proxy for mstatus to restrict readable and writable bits to CV32E40P
        // RW bits: FS (14:13), MPP (12:11), MPIE (7), MIE (3) -> mask: 0x7888
        auto mstatus_delegate = spike_core->get_state()->csrmap[0x300];
        auto cv32_mstatus = std::make_shared<cv32e40p_mstatus_proxy_t>(spike_core, 0x300, mstatus_delegate);
        spike_core->get_state()->csrmap[0x300] = cv32_mstatus;
        
        // Force Spike mstatus to match RTL reset state (MPP=3 -> 0x1800)
        cv32_mstatus->write(0x1800);
        
        // Statically configure Spike to match CV32E40P's dcsr restrictions
        auto cv32_dcsr = std::make_shared<cv32e40p_dcsr_t>(spike_core, 0x7b0);
        spike_core->get_state()->csrmap[0x7b0] = cv32_dcsr;
        spike_core->get_state()->dcsr = cv32_dcsr;
        
        // Statically configure Spike's mtvec to match CV32E40P's 256-byte alignment restriction
        auto cv32_mtvec = std::make_shared<cv32e40p_mtvec_t>(spike_core, 0x305);
        spike_core->get_state()->csrmap[0x305] = cv32_mtvec;
        spike_core->get_state()->mtvec = cv32_mtvec;

        
        // Statically configure Spike's Machine Information CSRs to match CV32E40P identity
        spike_core->get_state()->csrmap[0xF11] = std::make_shared<const_csr_t>(spike_core, 0xF11, 0x00000602); // mvendorid
        spike_core->get_state()->csrmap[0xF12] = std::make_shared<const_csr_t>(spike_core, 0xF12, 0x00000004); // marchid
        spike_core->get_state()->csrmap[0xF13] = std::make_shared<const_csr_t>(spike_core, 0xF13, 0x00000000); // mimpid
        
        // Force misa to strictly match the CV32E40P configured value
        // Spike uses state.misa internally, but the guest will read from csrmap
        spike_core->get_state()->csrmap[0x301] = std::make_shared<const_csr_t>(spike_core, 0x301, 0x40001104);
        
        // Statically configure Spike's mie and mip for CV32E40P custom interrupts [31:16]
        auto cv32_mie = std::make_shared<cv32e40p_mie_t>(spike_core, 0x304);
        spike_core->get_state()->csrmap[0x304] = cv32_mie;
        spike_core->get_state()->mie = cv32_mie;

        auto cv32_mip = std::make_shared<cv32e40p_mip_t>(spike_core, 0x344);
        spike_core->get_state()->csrmap[0x344] = cv32_mip;
        spike_core->get_state()->mip = cv32_mip;

        // Hardware Loop CSRs (0xCC0 - 0xCC6)
        spike_core->get_state()->csrmap[0xCC0] = std::make_shared<basic_csr_t>(spike_core, 0xCC0, 0); // lpstart0
        spike_core->get_state()->csrmap[0xCC1] = std::make_shared<basic_csr_t>(spike_core, 0xCC1, 0); // lpend0
        spike_core->get_state()->csrmap[0xCC2] = std::make_shared<basic_csr_t>(spike_core, 0xCC2, 0); // lpcount0
        spike_core->get_state()->csrmap[0xCC4] = std::make_shared<basic_csr_t>(spike_core, 0xCC4, 0); // lpstart1
        spike_core->get_state()->csrmap[0xCC5] = std::make_shared<basic_csr_t>(spike_core, 0xCC5, 0); // lpend1
        spike_core->get_state()->csrmap[0xCC6] = std::make_shared<basic_csr_t>(spike_core, 0xCC6, 0); // lpcount1

        // PULP Custom Identifiers
        spike_core->get_state()->csrmap[0xCD0] = std::make_shared<const_csr_t>(spike_core, 0xCD0, 0); // uhartid
        spike_core->get_state()->csrmap[0xCD1] = std::make_shared<const_csr_t>(spike_core, 0xCD1, 3); // privlv (M-mode)
        spike_core->get_state()->csrmap[0xCD2] = std::make_shared<const_csr_t>(spike_core, 0xCD2, 0); // zfinx
        
        // CV32E40P default boot_addr_i is 0x80
        spike_core->get_state()->pc = 0x80;
        
        std::cout << "[DPI-C] Spike initialized successfully with ELF: " 
                  << (elf_file ? elf_file : "NONE") << std::endl;
    }

    // -------------------------------------------------------------------------
    // 2. Execution
    // -------------------------------------------------------------------------
    void rvviRefEventStep() {
        if (spike_core) {
            spike_retired_pc = (uint32_t)(spike_core->get_state()->pc & 0xFFFFFFFF);
            uint32_t pc_before = spike_core->get_state()->pc;
            spike_core->step(1);
            uint32_t pc_after = spike_core->get_state()->pc;
            
            // -----------------------------------------------------------------------
            // IMPERAS REFERENCE: How the default ISS handles riscv-dv completion
            // -----------------------------------------------------------------------
            // In Imperas OVPsim, there is a vendor_lib/imperas/design/monitor.sv module
            // that intercepts instruction fetches at the `write_tohost` address:
            //
            //     nm_get("write_tohost", _test_exit);
            //     ...
            //     if (_test_exit.enable && bus.IAddr==_test_exit.addr) begin
            //         if (!io.Shutdown) $display("Fetch: Exit Label");
            //         io.Shutdown = 1;
            //     end
            //
            // When io.Shutdown=1, Imperas forcefully terminates the test. 
            // However, core-v-verif riscv-dv BSP tests actually end in an exception handler
            // that executes WFI with MIE=0 to halt the core. Spike can natively detect this
            // via is_waiting_for_interrupt().
            // -----------------------------------------------------------------------
            
            // if (pc_before != 0x0 && pc_after == 0x0) {
            //     std::cerr << "[DPI-C] Spike PC jumped to 0x0! pc_before=0x" << std::hex << pc_before << std::endl;
            //     std::cerr << "[DPI-C] mcause = 0x" << std::hex << spike_core->get_state()->mcause->read() << std::endl;
            //     std::cerr << "[DPI-C] mtval = 0x" << std::hex << spike_core->get_state()->mtval->read() << std::endl;
            // }
        }
    }

    // -------------------------------------------------------------------------
    // 3. State Extraction & Comparison (32-bit Masked)
    // -------------------------------------------------------------------------
    
    // Compare Program Counter (PC)
    // Returns Spike's PC so SystemVerilog can handle resynchronization
    uint32_t rvviRefPcCompare(const svBitVecVal* rtl_pc) {
        if (!spike_core) return 0xFFFFFFFF;
        
        return spike_retired_pc;
    }

    // Compare General Purpose Registers (GPRs)
    int rvviRefGprsCompare(int reg_index, const svBitVecVal* rtl_reg_val) {
        if (!spike_core) return -1;

        // Mask to 32 bits for CV32E40P comparison
        uint32_t spike_val = (uint32_t)(spike_core->get_state()->XPR[reg_index] & 0xFFFFFFFF);
        uint32_t rtl_val   = rtl_reg_val[0];
        
        if (spike_val != rtl_val) {
             std::cerr << "[DPI-C] GPR[" << std::dec << reg_index << "] Mismatch! Spike: 0x" 
                       << std::hex << spike_val << " RTL: 0x" << rtl_val << std::endl;
             return 1;
        }
        return 0;
    }

    // Explicitly notify Spike when the RTL takes a trap
    void rvviRefInjectTrap(int cause, int epc, int tval) {
        if (!spike_core) return;
        std::cout << "[DPI-C] Spike injecting trap: cause=0x" << std::hex << cause 
                  << " epc=0x" << epc << " tval=0x" << tval << std::endl;
                  
        class processor_t_public : public processor_t {
        public:
            using processor_t::take_trap;
        };
        
        custom_trap_t t(cause, tval);
        static_cast<processor_t_public*>(spike_core)->take_trap(t, epc);
    }

    // Compare Control and Status Registers (CSRs)
    int rvviRefCsrCompare(int csr_address, const svBitVecVal* rtl_csr_val) {
        if (!spike_core) return -1;

        // Mask to 32 bits for CV32E40P comparison
        uint32_t spike_csr_val = (uint32_t)(spike_core->get_csr(csr_address) & 0xFFFFFFFF);
        uint32_t rtl_val       = rtl_csr_val[0];

        if (spike_csr_val != rtl_val) {
            std::cerr << "[DPI-C] CSR[0x" << std::hex << csr_address << "] Mismatch! Spike: 0x" 
                      << spike_csr_val << " RTL: 0x" << rtl_val << std::endl;
            return 1;
        }
        return 0;
    }

    // Get Spike's value for a given GPR index
    int rvviRefGetGpr(int reg_index) {
        if (!spike_core) return 0;
        return (int)(spike_core->get_state()->XPR[reg_index] & 0xFFFFFFFF);
    }

    // Get Spike's value for a given CSR address
    int rvviRefGetCsr(int csr_address) {
        if (!spike_core) return 0;
        return (int)(spike_core->get_csr(csr_address) & 0xFFFFFFFF);
    }

    // -------------------------------------------------------------------------
    // 4. Teardown
    // -------------------------------------------------------------------------
    void rvviRefShutdown() {
        std::cout << "[DPI-C] Shutting down Spike Reference Model..." << std::endl;
        if (spike_sim) {
            delete spike_sim;
            spike_sim = nullptr;
            spike_core = nullptr;
        }
        if (spike_cfg) {
            delete spike_cfg;
            spike_cfg = nullptr;
        }
    }
}
