#include <iostream>
#include <vector>
#include <string>
#include <iomanip>
#include <cstdarg>

// Xcelium DPI-C standard header
#include "svdpi.h"
#include "vpi_user.h"

// Helper to log messages through VPI to EDA simulator log files and flush stdout immediately
inline void dpi_print(const char* format, ...) {
    char buffer[2048];
    va_list args;
    va_start(args, format);
    vsnprintf(buffer, sizeof(buffer), format, args);
    va_end(args);

    vpi_printf((PLI_BYTE8*)"%s", buffer);
    fflush(stdout);
}


// Spike Simulator Headers 
#include "riscv/debug_module.h"
#include "riscv/sim.h"
#include "riscv/processor.h"
#include "riscv/mmu.h"
#include "riscv/cfg.h"
#include "riscv/Params.h"
#include "riscv/csrs.h"


// Debug Control and Status (``dcsr``)
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// CSR Address: 0x7B0

// Reset Value: 0x4000_0003

// .. note::

//    The **ebreaks**, **ebreaku** and **prv** bitfields of this CSR are marked as R/W in Debug Specification 0.13.2. However,
//    as CV32E40P only supports machine mode, these bitfields are implemented as WARL bitfields (corresponding to how these bitfields will
//    be specified in the forthcoming Debug Specification 0.14.0).

// Detailed:

// .. table::
//   :widths: 15 15 70
//   :class: no-scrollbar-table

//   +-----------+-----------+-------------------------------------------------------------------------------------------------+
//   | **Bit #** | **Mode**  | **Description**                                                                                 |
//   +===========+===========+=================================================================================================+
//   | 31:28     | RO (0x4)  | **xdebugver:** returns 4 - External debug support exists as it is described in this document.   |
//   +-----------+-----------+-------------------------------------------------------------------------------------------------+
//   | 27:16     | RO (0x0)  | Reserved                                                                                        |
//   +-----------+-----------+-------------------------------------------------------------------------------------------------+
//   | 15        | RW        | **ebreakm**                                                                                     |
//   +-----------+-----------+-------------------------------------------------------------------------------------------------+
//   | 14        | RO (0x0)  | Reserved                                                                                        |
//   +-----------+-----------+-------------------------------------------------------------------------------------------------+
//   | 13        | RO (0x0)  | **ebreaks**. Always 0.                                                                          |
//   +-----------+-----------+-------------------------------------------------------------------------------------------------+
//   | 12        | RO (0x0)  | **ebreaku**. Always 0.                                                                          |
//   +-----------+-----------+-------------------------------------------------------------------------------------------------+
//   | 11        | RW        | **stepie**                                                                                      |
//   +-----------+-----------+-------------------------------------------------------------------------------------------------+
//   | 10        | RO (0x0)  | **stopcount**. Always 0.                                                                        |
//   +-----------+-----------+-------------------------------------------------------------------------------------------------+
//   | 9         | RO (0x0)  | **stoptime**. Always 0.                                                                         |
//   +-----------+-----------+-------------------------------------------------------------------------------------------------+
//   | 8:6       | RO        | **cause**                                                                                       |
//   +-----------+-----------+-------------------------------------------------------------------------------------------------+
//   | 5         | RO (0x0)  | Reserved                                                                                        |
//   +-----------+-----------+-------------------------------------------------------------------------------------------------+
//   | 4         | RO (0x0)  | **mprven**. Always 0.                                                                           |
//   +-----------+-----------+-------------------------------------------------------------------------------------------------+
//   | 3         | RO (0x0)  | **nmip**. Always 0.                                                                             |
//   +-----------+-----------+-------------------------------------------------------------------------------------------------+
//   | 2         | RW        | **step**                                                                                        |
//   +-----------+-----------+-------------------------------------------------------------------------------------------------+
//   | 1:0       | RO (0x3)  | **prv:** returns the current priviledge mode                                                    |
//   +-----------+-----------+-------------------------------------------------------------------------------------------------+

extern bool cv32_has_u;

class cv32e40p_dcsr_t : public dcsr_csr_t {
public:
    cv32e40p_dcsr_t(processor_t* const proc, const reg_t addr) : dcsr_csr_t(proc, addr) {}
    bool unlogged_write(const reg_t val) noexcept override {
        reg_t current = read();
        reg_t new_val = val;
        
        // ebreaks (13) is hardwired to 0 (WARL)
        new_val &= ~(1ULL << 13);
        
        if (!cv32_has_u) {
            // ebreaku (12) is hardwired to 0 (WARL)
            new_val &= ~(1ULL << 12);
            // prv (1:0) is hardwired to 3 (Machine Mode) (WARL)
            new_val = (new_val & ~3ULL) | 3ULL;
        } else {
            // prv can only be 0 (U) or 3 (M)
            reg_t prv_val = val & 3ULL;
            if (prv_val != 0 && prv_val != 3) {
                // If invalid, fallback to M mode
                new_val = (new_val & ~3ULL) | 3ULL;
            }
        }
        
        // dpi_print("[SPIKE DCSR MODIFICATION] PC: 0x%08lx | Before: 0x%08lx | After: 0x%08lx\n", proc->get_state()->pc, current, new_val);
        // dpi_print("  xdebugver [31:28] = 0x%lx\n", (new_val >> 28) & 0xF);
        // dpi_print("  ebreakm   [15]    = %lu\n", (new_val >> 15) & 1);
        // dpi_print("  ebreakh   [14]    = %lu\n", (new_val >> 14) & 1);
        // dpi_print("  ebreaks   [13]    = %lu\n", (new_val >> 13) & 1);
        // dpi_print("  ebreaku   [12]    = %lu\n", (new_val >> 12) & 1);
        // dpi_print("  stepie    [11]    = %lu\n", (new_val >> 11) & 1);
        // dpi_print("  stopcount [10]    = %lu\n", (new_val >> 10) & 1);
        // dpi_print("  stoptime  [9]     = %lu\n", (new_val >> 9) & 1);
        // dpi_print("  cause     [8:6]   = %lu\n", (new_val >> 6) & 7);
        // dpi_print("  mprven    [4]     = %lu\n", (new_val >> 4) & 1);
        // dpi_print("  nmip      [3]     = %lu\n", (new_val >> 3) & 1);
        // dpi_print("  step      [2]     = %lu\n", (new_val >> 2) & 1);
        // dpi_print("  prv       [1:0]   = %lu\n", new_val & 3);

        return dcsr_csr_t::unlogged_write(new_val);
    }
    
    reg_t read() const noexcept override {
        reg_t val = dcsr_csr_t::read();
        
        // Enforce xdebugver (31:28) = 4
        val = (val & 0x0FFFFFFF) | (4ULL << 28);
        
        // ebreaks (13) = 0
        val &= ~(1ULL << 13);
        
        if (!cv32_has_u) {
            // ebreaku (12) = 0
            val &= ~(1ULL << 12);
            // prv (1:0) = 3
            val = (val & ~3ULL) | 3ULL;
        } else {
            reg_t prv_val = val & 3ULL;
            if (prv_val != 0 && prv_val != 3) {
                val = (val & ~3ULL) | 3ULL;
            }
        }
        
        // mprven (4), nmip (3), stopcount (10), stoptime (9) are always 0
        val &= ~((1ULL << 4) | (1ULL << 3) | (1ULL << 10) | (1ULL << 9));
        
        return val;
    }
};

class cv32e40p_tdata1_t : public tdata1_csr_t {
public:
    cv32e40p_tdata1_t(processor_t* const proc, const reg_t addr) : tdata1_csr_t(proc, addr) {}
    bool unlogged_write(const reg_t val) noexcept override {
        // CV32E40P tdata1 WARL: Only bit 2 (execute) is RW.
        // All other bits are fixed (type=2, dmode=1, action=1, m=1, reset: 0x28001040).
        reg_t forced_val = (val & 0x4ULL) | 0x28001040ULL;
        return tdata1_csr_t::unlogged_write(forced_val);
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
        
        //           << ", new_val=0x" << new_val << std::dec << std::endl;
        
        if (proc_ptr->get_state()->pc >= 0x1a110000 && proc_ptr->get_state()->pc < 0x1a111000) {
             dpi_print("[SPIKE DEBUG mstatus proxy read] PC: 0x%08lx | val: 0x%08lx | new_val: 0x%08lx\n", proc_ptr->get_state()->pc, val, new_val);
        }
                  
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
        
        if (proc_ptr->get_state()->pc >= 0x1a110000 && proc_ptr->get_state()->pc < 0x1a111000) {
             dpi_print("[SPIKE DEBUG mstatus proxy write] PC: 0x%08lx | current: 0x%08lx | val: 0x%08lx | new_val: 0x%08lx\n", proc_ptr->get_state()->pc, current, val, new_val);
        }

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

// Global pointers to hold the Spike simulation instance and configuration
sim_t* spike_sim = nullptr;
processor_t* spike_core = nullptr;
cfg_t* spike_cfg = nullptr;
uint32_t spike_retired_pc = 0;
uint32_t write_tohost_addr = 0;

// Dynamic debug addresses passed from the SV testbench
uint32_t dm_halt_addr_global = 0;
uint32_t dm_exception_addr_global = 0;

// DEBUG INSTRUMENTATION: last mip value seen by rvviRefSyncIrq, so we only print on change
// instead of flooding the log on every retire. Sentinel forces a print on the first call.
uint32_t dbg_last_irq_mip = 0xFFFFFFFFu;

// DEBUG INSTRUMENTATION: address window covering debug_test's single_step.S
// (~0x00012f00-0x000130c0) so rvviRefEventStep prints stay scoped to Test 18
// (Single stepping) instead of dumping all 250k+ retired instructions.
static inline bool dbg_in_single_step_window(uint32_t pc) {
    return (pc >= 0x00012f00u && pc <= 0x000130c0u) ||
           (pc >= dm_halt_addr_global && pc < dm_halt_addr_global + 0x1000u);
}

// Helper class to bypass protected unlogged_write method in csr_t
class csr_t_public : public csr_t {
public:
    using csr_t::unlogged_write;
    csr_t_public(processor_t* const proc, const reg_t addr) : csr_t(proc, addr) {}
};

extern "C" {

    // -------------------------------------------------------------------------
    // 1. Initialization
    // -------------------------------------------------------------------------
    void rvviRefInit(const char* isa, const char* elf_file, const char* nm_file,
                     const svBitVecVal* boot_addr_ptr, const svBitVecVal* dm_halt_addr_ptr, const svBitVecVal* dm_exception_addr_ptr) {
        uint32_t boot_addr = *boot_addr_ptr;
        uint32_t dm_halt_addr = *dm_halt_addr_ptr;
        uint32_t dm_exception_addr = *dm_exception_addr_ptr;
        
        dpi_print("[DPI-C] Initializing Spike Reference Model...\n");
        dpi_print("[DPI-C]   boot_addr=0x%x dm_halt_addr=0x%x dm_exception_addr=0x%x\n", boot_addr, dm_halt_addr, dm_exception_addr);

        // Store addresses globally for use in rvviRefEventStep
        dm_halt_addr_global = dm_halt_addr;
        dm_exception_addr_global = dm_exception_addr;
        
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
                        dpi_print("[DPI-C] Found write_tohost at 0x%x\n", write_tohost_addr);
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
                            dpi_print("[DPI-C] Found write_tohost (via riscv32-corev-elf-nm) at 0x%x\n", write_tohost_addr);
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
        // Map debug ROM region starting at dm_halt_addr to cover both .debugger and .debugger_exception sections
        // Note: Spike's mem_cfg_t requires the base address to be page aligned (4KB).
        reg_t aligned_dm_halt = dm_halt_addr & ~0xFFFULL;
        mem_layout.push_back(mem_cfg_t(aligned_dm_halt, 0x11000));
        std::vector<size_t> hartids = {0}; // 1 hart with ID 0
        spike_cfg = new cfg_t(
            std::make_pair((reg_t)0, (reg_t)0), // default_initrd_bounds
            nullptr,                            // default_bootargs
            target_isa.c_str(),                 // default_isa
            "M",                                // default_priv
            "vlen:128,elen:64",                 // default_varch
            true,                               // default_misaligned
            endianness_little,                  // default_endianness
            16,                                 // default_pmpregions
            mem_layout,                         // default_mem_layout
            hartids,                            // default_hartids
            false,                              // default_real_time_clint
            1                                   // default_trigger_count
        );
        
        // Pass the compiled ELF file to Spike so it loads the identical memory image
        std::vector<std::string> args;
        if (elf_file) {
            args.push_back(elf_file);
        } else {
            dpi_print("[DPI-C] Error: No ELF file provided for Spike initialization.\n");
        }
        
        // Setup modern Spike sim_t arguments
        std::vector<std::pair<reg_t, mem_t*>> mems;
        mems.push_back(std::make_pair(0x00000000, new mem_t(0x20000000)));
        mems.push_back(std::make_pair(0x20000000, new mem_t(0x01000000)));
        // Spike's bus_t resolves accesses using upper_bound(). It routes accesses after
        // 0x1A110000 to the 4KB debug_module. If we map RAM at 0x1A110000, Spike's debug
        // module will overwrite it in the device map during sim_t instantiation.
        // By explicitly mapping RAM exactly at dm_halt_addr (e.g. 0x1A110800), we inject
        // a new key into the bus map that perfectly shadows the debug module for the
        // .debugger section (custom Debug ROM from the test ELF) and .debugger_exception.
        mems.push_back(std::make_pair(dm_halt_addr, new mem_t(0x11000)));
        std::vector<std::pair<reg_t, abstract_device_t*>> plugin_devices;
        debug_module_config_t dmc;
        openhw::Params params;

        // Configure the debug exception handler address to match the RTL's dm_exception_addr_i pin.
        // Without this, Spike defaults to 0x1A140000, causing a PC mismatch when an exception
        // occurs inside the Debug ROM (e.g., Test 11's illegal CSR read).
        params.set_uint64_t("/top/core/0/", "debug_exception_handler_addr",
                           (uint64_t)dm_exception_addr);

        // CV32E40P's Load-Store Unit natively supports misaligned accesses without throwing exceptions.
        // OpenHW's Processor class overrides the cfg_t default_misaligned value with its own params.
        params.set_bool("/top/core/0/", "misaligned", true);
        
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
        
        // CV32E40P Trigger CSR: tdata1 (0x7a1) proxy & reset value
        // Spike defaults to mcontrol6 (type 15) → 0xF0000000. CV32E40P implements mcontrol
        // (type 2) with reset value 0x28001040 (dmode=1) and only bit 2 (execute) is RW.
        auto tdata1_csr = std::make_shared<cv32e40p_tdata1_t>(spike_core, 0x7a1);
        spike_core->get_state()->csrmap[0x7a1] = tdata1_csr;
        bool orig_debug_mode = spike_core->get_state()->debug_mode;
        spike_core->get_state()->debug_mode = true;
        tdata1_csr->unlogged_write(0x28001040);
        spike_core->get_state()->debug_mode = orig_debug_mode;

        // CV32E40P Trigger Info (tinfo, 0x7a4): Reset/constant value = 0x0000_0004
        // Spike's trigger module dynamically computes tinfo based on all supported trigger types,
        // returning 0x807c (types 2,3,4,5,6,15 etc.). CV32E40P only implements type 2 (mcontrol),
        // so tinfo must always read 0x4 (bit 2 set = type 2 supported only).
        spike_core->get_state()->csrmap[0x7a4] = std::make_shared<const_csr_t>(spike_core, 0x7a4, 0x4);

        // CV32E40P implements mscontext (CSR 0x7aa) as a read-only-zero register.
        // Spike does not natively instantiate this CSR, so any access to it throws an
        // illegal instruction exception, immediately breaking lockstep.
        spike_core->get_state()->csrmap[0x7aa] = std::make_shared<const_csr_t>(spike_core, 0x7aa, 0);

        // CV32E40P implements tdata3 (CSR 0x7a3) as read-only-zero in both M-Mode and
        // Debug Mode: "CV32E40P does not support the features requiring this register.
        // Writes are ignored and reads will always return zero." (control_status_registers.rst,
        // csr-tdata3). Spike's default tdata3_csr_t is a real, storage-backed "textra"
        // register (mhvalue/mhselect/sbytemask/svalue/sselect) that CV32E40P's trigger module
        // does not implement (debug.rst lists only tselect/tdata1/tdata2/tinfo as the
        // "most relevant" implemented trigger registers). module_t::tdata3_write only blocks
        // writes when tdata1.dmode && !debug_mode, so a write to tdata3 issued while already
        // in Debug Mode (as this test does, deliberately, to close coverage holes) is let
        // through and latched into svalue, unlike the RTL's unconditional hardwired-zero.
        spike_core->get_state()->csrmap[0x7a3] = std::make_shared<const_csr_t>(spike_core, 0x7a3, 0);

        // Set initial PC from the testbench's boot_addr_i
        spike_core->get_state()->pc = boot_addr;
        
        dpi_print("[DPI-C] Spike initialized successfully with ELF: %s\n", (elf_file ? elf_file : "NONE"));
    }

    // -------------------------------------------------------------------------
    // 2. Execution
    // -------------------------------------------------------------------------
    void rvviRefEventStep(const svBitVecVal* rtl_pc_ptr) {
        uint32_t rtl_pc = *rtl_pc_ptr;
        
        if (spike_core) {
            // ---------------------------------------------------------------
            // Debug Halt Injection via RTL PC Inference
            // ---------------------------------------------------------------
            // If the RTL is retiring the Debug ROM entry instruction (dm_halt_addr),
            // but Spike is not yet in debug mode, it means the RTL just took an
            // asynchronous debug halt. We set halt_request so Spike takes the debug
            // trap on its next step, perfectly mirroring the RTL's execution.
            // pending_step_exception is true when Spike has a step exception pending
            // (either STEP_STEPPING or STEP_STEPPED) and the RTL is already at the
            // debug ROM entry. In both states we must NOT inject a halt_request,
            // as the step exception will fire naturally without external stimulation.
            bool step_state_stepping = (spike_core->get_state()->single_step == spike_core->get_state()->STEP_STEPPING);
            bool step_state_stepped  = (spike_core->get_state()->single_step == spike_core->get_state()->STEP_STEPPED);
            bool pending_step_exception = step_state_stepping || step_state_stepped;
            //printf("[SPIKE WRAPPER] RTL PC: 0x%08x | single_step: %d | debug_mode: %d | pending_step=%d\n", rtl_pc, spike_core->get_state()->single_step, spike_core->get_state()->debug_mode, (int)pending_step_exception);
            if (rtl_pc == dm_halt_addr_global && !spike_core->get_state()->debug_mode && !pending_step_exception) {
                spike_core->halt_request = processor_t::HR_REGULAR;
            }

            uint64_t minstret_before = spike_core->get_state()->minstret->read();
            uint32_t pc_before = (uint32_t)(spike_core->get_state()->pc & 0xFFFFFFFF);
            
            // If we are injecting a debug trap this cycle, or if RTL jumped straight to the 
            // Debug ROM entry due to an exception during a single-step (pending_step_exception),
            // Spike will ultimately execute the Debug ROM entry in this cycle.
            if (spike_core->halt_request == processor_t::HR_REGULAR ||
                (rtl_pc == dm_halt_addr_global && pending_step_exception && !spike_core->get_state()->debug_mode)) {
                pc_before = dm_halt_addr_global;
            }
            
            // CV32E40P specifically treats mret inside debug mode as a debug exception.
            // Standard Spike executes it normally. We intercept it here, skip step(1) entirely
            // to prevent CSR modifications, and manually force the PC to dm_exception_addr_global.
            uint32_t insn_to_exec = 0;
            try {
                insn_to_exec = spike_core->get_mmu()->load_insn(pc_before).insn.bits();
            } catch (...) {}
            const uint32_t OPCODE_MRET = 0x30200073;

            if (spike_core->get_state()->debug_mode && insn_to_exec == OPCODE_MRET) {
                spike_core->get_state()->pc = dm_exception_addr_global;
                spike_retired_pc = pc_before;
                return;
            }

            if (pc_before == 0x5da || pc_before == 0x5d6) {
                uint32_t mip_val = spike_core->get_csr(0x344);
                uint32_t mie_val = spike_core->get_csr(0x304);
                uint32_t mstatus_val = spike_core->get_csr(0x300);
                dpi_print("[SPIKE DEBUG] PC: 0x%08x | mip: 0x%08x | mie: 0x%08x | mstatus: 0x%08x\n", pc_before, mip_val, mie_val, mstatus_val);
            }

            // DEBUG INSTRUMENTATION: full pre-step Spike state around Test 18 (Single stepping),
            // to cross-check against the [SV DEBUG retire]/[SV DEBUG irq_mip] prints in
            // uvmt_cv32e40p_step_compare.sv for the same instant.
            // bool dbg_window_pre = dbg_in_single_step_window(rtl_pc) || dbg_in_single_step_window(pc_before);
            // if (dbg_window_pre) {
            //     uint32_t mip_val = spike_core->get_csr(0x344);
            //     uint32_t mie_val = spike_core->get_csr(0x304);
            //     uint32_t dcsr_val = spike_core->get_csr(0x7b0);
            //     dpi_print("[SPIKE DEBUG pre-step] rtl_pc=0x%08x pc_before=0x%08x debug_mode=%d single_step=%d halt_request=%d pending_step_exception=%d mip=0x%08x mie=0x%08x dcsr=0x%08x minstret_before=%lu\n",
            //               rtl_pc, pc_before, spike_core->get_state()->debug_mode, spike_core->get_state()->single_step,
            //               (int)spike_core->halt_request, (int)pending_step_exception, mip_val, mie_val, dcsr_val, minstret_before);
            // }

            spike_core->step(1);

            // if (dbg_window_pre) {
            //     uint32_t pc_after = (uint32_t)(spike_core->get_state()->pc & 0xFFFFFFFF);
            //     uint64_t minstret_after = spike_core->get_state()->minstret->read();
            //     dpi_print("[SPIKE DEBUG post-step] pc_after=0x%08x mcause=0x%08lx minstret_after=%lu (retired=%d) debug_mode=%d single_step=%d\n",
            //               pc_after, spike_core->get_state()->mcause->read(), minstret_after,
            //               (minstret_after != minstret_before), spike_core->get_state()->debug_mode, spike_core->get_state()->single_step);
            // }

            // Clear halt_request after it has been consumed by step()
            spike_core->halt_request = processor_t::HR_NONE;
            
            // If Spike took a trap (synchronous exception or asynchronous interrupt)
            // during the step, it did not successfully retire an instruction.
            // We must step Spike forward through the trap handler until it actually 
            // retires an instruction to stay in lockstep with the RTL's retirement stream.
            while (spike_core->get_state()->minstret->read() == minstret_before) {
                uint64_t mcause = spike_core->get_state()->mcause->read();
                bool is_interrupt = (mcause & 0x80000000) != 0;
                uint64_t cause = mcause & 0x7FFFFFFF;

                // DEBUG INSTRUMENTATION: every fast-forward loop iteration is Spike executing
                // one instruction that did NOT retire (a trap handler entry, a stale-mcause
                // exception, etc.) while chasing the next real retirement. This is exactly where
                // a premature interrupt (mip forwarded to Spike before the RTL actually commits
                // to it) would manifest as an unexpected trap here.
                if (dbg_in_single_step_window(pc_before)) {
                    uint32_t mip_val = spike_core->get_csr(0x344);
                    dpi_print("[SPIKE DEBUG loop-iter] pc_before=0x%08x mcause=0x%08lx is_interrupt=%d cause=%lu debug_mode=%d single_step=%d mip=0x%08x\n",
                              pc_before, mcause, is_interrupt, cause, spike_core->get_state()->debug_mode,
                              spike_core->get_state()->single_step, mip_val);
                }

                // Note: The CV32E40P documentation (pipeline.rst and exceptions_interrupts.rst) 
                // does not explicitly document which pipeline stage detects each exception. 
                // However, based on RTL inspection (cv32e40p_id_stage.sv) and standard RISC-V design 
                // applied to the 4-stage pipeline described in pipeline.rst:
                // 
                // 1. Fetch/Decode Exceptions: Instruction address misaligned (0), Instruction access fault (1), 
                //    and Illegal instruction (2) are detected in the Instruction Fetch (IF) or 
                //    Instruction Decode (ID) stages. These instructions are dropped before Execution.
                //    Because the behavioral tracer only creates a "log of the executed instructions" 
                //    (as per tracer.rst), it does not log these dropped instructions, emitting no retire event,
                //    only logging those that reach the EX stage.
                // 
                // 2. Execute Exceptions: Synchronous exceptions like ecall (11), ebreak (3), and LSU faults 
                //    (e.g., Load access fault) successfully decode and reach the Execute (EX) stage where they 
                //    trigger the trap. 
                // 
                //    Note the paradox: The RTL file cv32e40p_id_stage.sv states "Illegal/ebreak/ecall are never 
                //    counted as retired instructions." This refers to the hardware `minstret` performance counter! 
                //    Neither the RTL's `minstret` nor Spike's `minstret` increments for these instructions.
                //    HOWEVER, the behavioral testbench tracer (cv32e40p_tracer.sv) monitors the EX/WB stages. 
                //    Because ecall and ebreak reach the EX stage, the tracer *does* log them and emits a 
                //    testbench `riscv_retire` event. Because illegal instructions are squashed in ID, the tracer 
                
                // IMPORTANT: We must NOT break on stale mcause when Spike just entered debug mode.
                // Debug entry does not update mcause (it sets dcsr.cause instead), so mcause may
                // contain a stale value >= 3 from a previous exception. Breaking here would prevent
                // Spike from executing the first instruction of the debug handler.
                
                mcause = spike_core->get_state()->mcause->read();
                is_interrupt = (mcause & 0x80000000) != 0;
                
                // Debug mode traps (e.g. ebreak) update dcsr.cause, not mcause.
                // If we are in debug mode, mcause is stale and may incorrectly have the interrupt bit set.
                if (spike_core->get_state()->debug_mode) {
                    is_interrupt = false;
                }
                
                cause = mcause & 0x7FFFFFFF;
                bool is_ex_exception = !is_interrupt && cause >= 3;
                
                // However, if the instruction was an ebreak or ecall, the RTL tracer ALWAYS logs it,
                // even if we are already in debug mode. So we must explicitly peek at the instruction
                // to see if we should break and report it.
                uint32_t insn = 0;
                try {
                    // load_insn() fetches the actual instruction machine-code binary from memory
                    insn = spike_core->get_mmu()->load_insn(pc_before).insn.bits();
                } catch (...) {
                    // Ignore memory faults during inspection
                }
                
                // These are NOT memory addresses. They are the architectural RISC-V machine-code
                // binary representations (opcodes) for the ebreak, c.ebreak, and ecall instructions.
                const uint32_t OPCODE_EBREAK   = 0x00100073;
                const uint32_t OPCODE_C_EBREAK = 0x9002;
                const uint32_t OPCODE_ECALL    = 0x00000073;

                bool is_ebreak = (insn == OPCODE_EBREAK) || ((insn & 0xFFFF) == OPCODE_C_EBREAK);
                bool is_ecall  = (insn == OPCODE_ECALL);
                if (pc_before == 0x00012f72) {
                    uint32_t mip_val = spike_core->get_csr(0x344);
                    dpi_print("[SPIKE DEBUG] pc_before=0x%08x, insn=0x%08x, is_ebreak=%d, is_ex_exception=%d, is_interrupt=%d, debug_mode=%d, mcause=0x%lx, mip=0x%08x\n",
                           pc_before, insn, is_ebreak, is_ex_exception, is_interrupt, spike_core->get_state()->debug_mode, spike_core->get_state()->mcause->read(), mip_val);
                }
                if ((is_ex_exception && !spike_core->get_state()->debug_mode) || 
                    (!is_interrupt && (is_ebreak || is_ecall))) {
                    break;
                }
                
                pc_before = (uint32_t)(spike_core->get_state()->pc & 0xFFFFFFFF);
                spike_core->step(1);
            }
            
            spike_retired_pc = pc_before;
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
             dpi_print("[DPI-C] GPR[%d] Mismatch! Spike: 0x%x RTL: 0x%x\n", reg_index, spike_val, rtl_val);
             return 1;
        }
        return 0;
    }

    // Explicitly notify Spike when the RTL takes a trap
    void rvviRefInjectTrap(int cause, int epc, int tval) {
        if (!spike_core) return;
        dpi_print("[DPI-C] Spike injecting trap: cause=0x%x epc=0x%x tval=0x%x\n", cause, epc, tval);
                  
        class processor_t_public : public processor_t {
        public:
            using processor_t::take_trap;
        };
        
        // Only inject M-mode traps. Debug mode traps (enter/exit) are handled
        // by halt_request injection in rvviRefEventStep, not here.
        if (!spike_core->get_state()->debug_mode) {
            custom_trap_t t(cause, tval);
            static_cast<processor_t_public*>(spike_core)->take_trap(t, epc);
        }
    }

    // Compare Control and Status Registers (CSRs)
    int rvviRefCsrCompare(int csr_address, const svBitVecVal* rtl_csr_val) {
        if (!spike_core) return -1;

        // Mask to 32 bits for CV32E40P comparison
        uint32_t spike_csr_val = (uint32_t)(spike_core->get_csr(csr_address) & 0xFFFFFFFF);
        uint32_t rtl_val       = rtl_csr_val[0];

        if (spike_csr_val != rtl_val) {
            dpi_print("[DPI-C] CSR[0x%x] Mismatch! Spike: 0x%x RTL: 0x%x\n", csr_address, spike_csr_val, rtl_val);
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
    // 4. Synchronize Asynchronous Interrupts (MIP)
    // -------------------------------------------------------------------------
    // The CV32E40P RTL tracer does not emit riscv_retire events for interrupts,
    // so Spike needs to know when an interrupt pin (MIP) changes to evaluate it
    // synchronously on the next step.
    void rvviRefSyncIrq(const svBitVecVal* mip_val_ptr) {
        if (!spike_core) return;
        uint32_t mip_val = *mip_val_ptr;

        // DEBUG INSTRUMENTATION: print every time the mip value handed to Spike changes,
        // together with the Spike-side context at that instant. Cross-reference against
        // [SV DEBUG retire] (which prints the same fwd_irq value from the SV side) and
        // [SV DEBUG irq_mip] (which shows whether the RTL-side sticky irq_mip register
        // itself is latched/stuck) to see exactly what Spike is being told and why.
        if (mip_val != dbg_last_irq_mip) {
            dpi_print("[SPIKE DEBUG rvviRefSyncIrq] mip: 0x%08x -> 0x%08x | spike_pc=0x%08lx | debug_mode=%d | single_step=%d | halt_request=%d\n",
                      dbg_last_irq_mip, mip_val, spike_core->get_state()->pc, spike_core->get_state()->debug_mode,
                      spike_core->get_state()->single_step, (int)spike_core->halt_request);
            dbg_last_irq_mip = mip_val;
        }

        if (spike_core->get_state()->csrmap.count(0x344)) {
            // Write to mip directly using backdoor_write_with_mask, which bypasses
            // the write_mask (since CV32E40P's mip is read-only from software).
            static_cast<mip_csr_t*>(spike_core->get_state()->csrmap[0x344].get())
                ->backdoor_write_with_mask(0xFFFFFFFF, mip_val);
        }
    }

    // -------------------------------------------------------------------------
    // 5. Performance Counter Synchronization (mcycle/minstret ghosting)
    // -------------------------------------------------------------------------
    // Per the DV methodology paper "The evolution of RISC-V processor verification":
    //   "A second problem when using an ISS as a reference model is the timing of
    //    'side effects'. An instruction is said to have side effects if it updates
    //    one or more state variables which are not explicitly part of the instruction.
    //    For example, the CSR minstret is updated each time an instruction is retired."
    //
    // Because Spike is instruction-accurate and does not model cycle-accurate pipeline
    // stalls or memory latencies, it is impossible for it to independently compute the
    // RTL's exact mcycle value. We synchronize these specific CSRs from the RTL to
    // Spike before each step, so that any csrr mcycle/minstret reads the correct value.
    void rvviRefSyncPerfCounters(const svBitVecVal* mcycle_val_ptr, const svBitVecVal* minstret_val_ptr) {
        if (!spike_core) return;
        
        uint32_t mcycle_val = *mcycle_val_ptr;
        uint32_t minstret_val = *minstret_val_ptr;
        
        // Sync mcycle (CSR 0xB00) - lower 32 bits
        if (spike_core->get_state()->csrmap.count(0xB00)) {
            static_cast<csr_t_public*>(spike_core->get_state()->csrmap[0xB00].get())->unlogged_write(mcycle_val);
        }
        // Sync minstret (CSR 0xB02) - lower 32 bits
        if (spike_core->get_state()->csrmap.count(0xB02)) {
            static_cast<csr_t_public*>(spike_core->get_state()->csrmap[0xB02].get())->unlogged_write(minstret_val);
        }
    }

    // -------------------------------------------------------------------------
    // 6. Teardown
    // -------------------------------------------------------------------------
    void rvviRefShutdown() {
        dpi_print("[DPI-C] Shutting down Spike Reference Model...\n");
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
