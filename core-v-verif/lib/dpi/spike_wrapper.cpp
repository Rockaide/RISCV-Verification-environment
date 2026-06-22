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

// Global pointers to hold the Spike simulation instance and configuration
sim_t* spike_sim = nullptr;
processor_t* spike_core = nullptr;
cfg_t* spike_cfg = nullptr;

extern "C" {

    // -------------------------------------------------------------------------
    // 1. Initialization
    // -------------------------------------------------------------------------
    void rvviRefInit(const char* isa, const char* elf_file) {
        std::cout << "[DPI-C] Initializing Spike Reference Model..." << std::endl;
        
        // Target CV32E40P capabilities
        std::string target_isa = isa ? isa : "RV32IMFC";
        
        // Configure Spike memory: 512MB starting at 0x0
        std::vector<mem_cfg_t> mem_layout;
        mem_layout.push_back(mem_cfg_t(0x00000000, 0x20000000));
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
            nullptr,              // log path
            false,                // dtb_enabled (typically false for bare-metal DV)
            nullptr,              // dtb_file
            false,                // socket_enabled
            nullptr,              // cmd_file
            params                // openhw::Params
        );
                              
        // Extract hart 0 (the primary core)
        spike_core = spike_sim->get_core(0);
        
        // Reset the processor to ensure deterministic state at time 0
        spike_core->reset();
        
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
            // Step the core by exactly 1 instruction to maintain lock-step with RTL
            spike_core->step(1);
        }
    }

    // -------------------------------------------------------------------------
    // 3. State Extraction & Comparison (32-bit Masked)
    // -------------------------------------------------------------------------
    
    // Compare Program Counter (PC)
    int rvviRefPcCompare(const svBitVecVal* rtl_pc) {
        if (!spike_core) return -1; 
        
        // Mask to 32 bits for CV32E40P comparison
        uint32_t spike_pc = (uint32_t)(spike_core->get_state()->pc & 0xFFFFFFFF);
        uint32_t rtl_val  = rtl_pc[0];
        
        if (spike_pc != rtl_val) {
            std::cerr << "[DPI-C] PC Mismatch! Spike: 0x" << std::hex << spike_pc 
                      << " RTL: 0x" << rtl_val << std::endl;
            return 1; 
        }
        return 0; 
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
