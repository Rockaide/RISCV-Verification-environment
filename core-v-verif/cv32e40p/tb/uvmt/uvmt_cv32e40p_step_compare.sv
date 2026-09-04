//
// Copyright 2020 OpenHW Group
//
// Licensed under the Solderpad Hardware Licence, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://solderpad.org/licenses/
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.0
//


`ifndef __UVMT_CV32E40P_STEP_COMPARE_SV__
`define __UVMT_CV32E40P_STEP_COMPARE_SV__

// Step-and-Compare between the CV32E40PE40P and Imperas OVPsim ISS
// Cloned from the Imperas demo at $(IMPERAS_HOME)/RTL_OVPmodel_step_compare/verilog_testbench/testbench.sv

/*
 * Copyright (c) 2005-2020 Imperas Software Ltd., www.imperas.com
 * Copyright (C) Tumbush Enterprises, LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied.
 *
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

//
// Execute step and compare of dut OVP instance vs riscv RTL instance
//
`ifndef T0_TYPE
  `define T0_TYPE "RV32IMC"
`endif

import uvm_pkg::*;      // needed for the UVM messaging service (`uvm_info(), etc.)

`include "uvm_macros.svh"
`define CV32E40P_CORE   $root.uvmt_cv32e40p_tb.dut_wrap.cv32e40p_wrapper_i.core_i
`define CV32E40P_TRACER $root.uvmt_cv32e40p_tb.dut_wrap.cv32e40p_wrapper_i.tracer_i

// TODO change names
`ifdef ISS_IMPERAS
`define CV32E40P_RM              $root.uvmt_cv32e40p_tb.iss_wrap.cpu
`define CV32E40P_RM_RVVI_STATE   $root.uvmt_cv32e40p_tb.iss_wrap.cpu.state
`define CV32E40P_RM_RVVI_CONTROL $root.uvmt_cv32e40p_tb.iss_wrap.cpu.control
`endif

`ifdef ISS_SPIKE
`endif


module uvmt_cv32e40p_step_compare
(
   uvma_clknrst_if                clknrst_if,
   uvmt_cv32e40p_step_compare_if  step_compare_if
);

`ifdef ISS_SPIKE
import "DPI-C" context function void rvviRefInit(
    string isa, string elf_file, string nm_file,
    input bit [31:0] boot_addr,
    input bit [31:0] dm_halt_addr,
    input bit [31:0] dm_exception_addr
);
import "DPI-C" context function void rvviRefEventStep(input bit [31:0] rtl_pc);
import "DPI-C" context function void rvviRefSyncPerfCounters(
    input bit [31:0] mcycle_val,
    input bit [31:0] minstret_val
);
import "DPI-C" context function void rvviRefSyncIrq(input bit [31:0] mip_val);
import "DPI-C" context function int rvviRefPcCompare(input bit [31:0] rtl_pc);
import "DPI-C" context function int rvviRefGprsCompare(input int reg_index, input bit [31:0] rtl_reg_val);
import "DPI-C" context function int rvviRefCsrCompare(input int csr_address, input bit [31:0] rtl_csr_val);
import "DPI-C" context function int rvviRefGetGpr(input int reg_index);
import "DPI-C" context function int rvviRefGetCsr(input int csr_address);
import "DPI-C" context function void rvviRefInjectTrap(input int cause, input int epc, input int tval);
import "DPI-C" context function void rvviRefShutdown();
`endif

   bit  Clk;
   bit  miscompare;
   bit  is_stall_sim = 0;
   bit  ignore_dpc_check = 0;
   bit  use_iss = 0;

  // FIXME:strichmo:when running random interrupts and random debug requests it is possible to enter debug mode
  // (while also acking an interrupt) when the debug program counter may or may not yet be pointing to the interrupt
  // vector (mtvec) upon debug entry.  However the PC stream should verify proper operation (the PC will mismatch when
  // the debug ROM eventually executes a dret).  For now we will skip this comparison if the test requests it
  initial begin
    if ($test$plusargs("ignore_dpc_check")) begin
      ignore_dpc_check = 1;
      `uvm_info("Step-and-Compare", $sformatf("Requesting +ignore_dpc_check"), UVM_NONE)
    end
    else begin
      ignore_dpc_check = 0;
    end
  end

  initial begin
    if ($test$plusargs("USE_ISS"))
      use_iss = 1;
  end

  // Set the is_stall_sim flag if random stalls are enabled
  // This will turn off some unpredictable checks:
  // - CSR wire checks
  // - Non-written GPR registers (per instructions)
  // Note that register writebacks to GPRs will still be checked during each instruction retirement even with stalls

  initial begin
    if (!$test$plusargs("rand_stall_obi_disable")) begin
      is_stall_sim = 1;
    end
  end

`ifdef ISS_SPIKE
  string elf_file;
  string nm_file;
  initial begin
    wait (clknrst_if.reset_n === 1'b0);
    wait (clknrst_if.reset_n === 1'b1);
    // Wait one clock edge after reset so that all initial blocks (in particular
    // tb_ifs.sv quasi_static_controls) have completed their time-0 signal
    // assignments (boot_addr, dm_halt_addr, dm_exception_addr) before we sample
    // them. Without this, a race condition results in reading garbage/uninitialized
    // values for these signals.
    @(posedge clknrst_if.clk);
    if ($value$plusargs("elf_file=%s", elf_file)) begin
      `uvm_info("Step-and-Compare", $sformatf("Initializing Spike with ELF: %s", elf_file), UVM_NONE)
      if ($value$plusargs("nm_file=%s", nm_file)) begin
        rvviRefInit("RV32IMC", elf_file, nm_file,
            $root.uvmt_cv32e40p_tb.core_cntrl_if.boot_addr,
            $root.uvmt_cv32e40p_tb.core_cntrl_if.dm_halt_addr,
            $root.uvmt_cv32e40p_tb.core_cntrl_if.dm_exception_addr
        );
      end else begin
        `uvm_info("Step-and-Compare", "No +nm_file specified, passing empty string", UVM_NONE)
        rvviRefInit("RV32IMC", elf_file, "",
            $root.uvmt_cv32e40p_tb.core_cntrl_if.boot_addr,
            $root.uvmt_cv32e40p_tb.core_cntrl_if.dm_halt_addr,
            $root.uvmt_cv32e40p_tb.core_cntrl_if.dm_exception_addr
        );
      end
    end else begin
      `uvm_fatal("Step-and-Compare", "No +elf_file specified for Spike ISS!")
    end
  end

  final begin
    rvviRefShutdown();
  end
`endif

  always begin
    wait (clknrst_if.reset_n === 1'b0);
    wait (clknrst_if.reset_n === 1'b1);
    if (is_stall_sim) begin
      `uvm_info("Step-andCompare", $sformatf("is_stall_sim set to 1, disabling CSR wire checks and stable GPR register checks"), UVM_NONE)
    end
  end

`ifdef ISS_SPIKE
  // ---------------------------------------------------------------------------------------
  // DEBUG INSTRUMENTATION: irq_mip sticky-register monitor.
  //
  // uvmt_cv32e40p_tb.sv's irq_mip register is only ever cleared via
  // step_compare_if.ovp_cpu_state_stepi (or, on the Imperas-only branch, when
  // iss_wrap.io.deferint == 1). ovp_cpu_state_stepi is driven exclusively from
  // uvmt_cv32e40p_iss_wrap.sv (cpu.control.state_stepi), which is only instantiated
  // `ifdef ISS_IMPERAS. When running with ISS_SPIKE, iss_wrap does not exist, so
  // ovp_cpu_state_stepi never toggles -- meaning irq_mip[idx] may latch permanently
  // once dut_wrap.cv32e40p_wrapper_i.irq_i[idx] pulses high even once, and never clear
  // for the rest of simulation. This monitor prints every time irq_mip changes value so
  // we can see directly whether it latches instead of clearing after an interrupt is
  // serviced and de-asserted.
  // ---------------------------------------------------------------------------------------
  bit [31:0] dbg_irq_mip_prev = 32'h0;
  always @(posedge clknrst_if.clk) begin
    if ($root.uvmt_cv32e40p_tb.irq_mip !== dbg_irq_mip_prev) begin
      $display("[SV DEBUG irq_mip] time=%0t irq_mip: 0x%08x -> 0x%08x | irq_i=0x%08x | ovp_cpu_state_stepi=%b | deferint_prime=%b | debug_mode=%b | insn_pc=0x%08x",
                $time, dbg_irq_mip_prev, $root.uvmt_cv32e40p_tb.irq_mip,
                $root.uvmt_cv32e40p_tb.dut_wrap.cv32e40p_wrapper_i.irq_i,
                step_compare_if.ovp_cpu_state_stepi, step_compare_if.deferint_prime,
                `CV32E40P_CORE.debug_mode, step_compare_if.insn_pc);
      dbg_irq_mip_prev = $root.uvmt_cv32e40p_tb.irq_mip;
    end
  end
`endif

   // PC History Buffer
   bit [31:0] pc_history_spike [45];
   bit [31:0] pc_history_rtl [45];
   int pc_history_idx = 0;
   int pc_history_count = 0;

   function automatic void print_mismatch_history(string msg);
      string hist_str = "";
      miscompare = 1;
      hist_str = {msg, $sformatf("\n--- PC HISTORY DUMP (Last %0d PCs) ---\n", pc_history_count)};
      for (int i = 0; i < pc_history_count; i++) begin
         int print_idx = (pc_history_idx - pc_history_count + i + 45) % 45;
         hist_str = {hist_str, $sformatf("  [T-%0d] Spike PC: 0x%08x | RTL PC: 0x%08x\n", (pc_history_count - i), pc_history_spike[print_idx], pc_history_rtl[print_idx])};
      end
      hist_str = {hist_str, "--------------------------------------"};
      `uvm_error("Step-and-Compare", hist_str)
   endfunction

                                                                                                          // Waiving Verissimo SVTB.32.2.0: Pass strings by reference unless otherwise needed
  function void check_32bit(input string compared, input bit [31:0] expected, input logic [31:0] actual); //@DVT_LINTER_WAIVER "MT20211228_1" disable SVTB.32.2.0
      static int now = 0;
      if (now != $time) begin
        miscompare = 0;
        now = $time;
      end
      if (expected !== actual) begin
        miscompare = 1;
`ifdef ISS_SPIKE
        `uvm_error("Step-and-Compare", $sformatf("%s expected=0x%8h and actual=0x%8h PC=0x%8h", compared, expected, actual, step_compare_if.insn_pc))
`else
        `uvm_error("Step-and-Compare", $sformatf("%s expected=0x%8h and actual=0x%8h PC=0x%8h", compared, expected, actual, step_compare_if.ovp_cpu_PCr))
`endif
      end else begin
        `uvm_info("Step-and-Compare", $sformatf("%s expected=0x%8h==actual", compared, actual), UVM_DEBUG)
      end
   endfunction // check_32bit

   function automatic void compare();
      int idx;
      logic [ 5:0] insn_regs_write_addr;
      logic [31:0] insn_regs_write_value;
      int          insn_regs_write_size;
      string       compared_str;
      bit ignore;

      logic [31:0] csr_val;

      // Compare PC
`ifdef ISS_SPIKE
      int spike_pc = rvviRefPcCompare(step_compare_if.insn_pc);
      
      pc_history_spike[pc_history_idx] = spike_pc;
      pc_history_rtl[pc_history_idx] = step_compare_if.insn_pc;
      pc_history_idx = (pc_history_idx + 1) % 45;
      if (pc_history_count < 45) pc_history_count++;

      if (spike_pc != step_compare_if.insn_pc) begin
         print_mismatch_history($sformatf("PC Mismatch detected! Spike: 0x%08x RTL: 0x%08x.", spike_pc, step_compare_if.insn_pc));
      end
`else
      check_32bit(.compared("PC"), .expected(`CV32E40P_RM_RVVI_STATE.pc), .actual(step_compare_if.insn_pc));
`endif
      step_compare_if.num_pc_checks++;

      // Compare GPR's
      // Assuming that `CV32E40P_TRACER.insn_regs_write size is never > 1.  Check this.
      // Note that dut_wrap is found 1 level up
      insn_regs_write_size = `CV32E40P_TRACER.insn_regs_write.size();
      if (insn_regs_write_size > 1) begin
        `uvm_error("Step-and-Compare",  $sformatf("Assume insn_regs_write size is 0 or 1 but is %0d", insn_regs_write_size))
      end
      else if (insn_regs_write_size == 1) begin // Get `CV32E40P_TRACER.insn_regs_write fields if size is 1
         insn_regs_write_addr  = `CV32E40P_TRACER.insn_regs_write[0].addr;
         insn_regs_write_value = `CV32E40P_TRACER.insn_regs_write[0].value;
         `uvm_info("Step-and-Compare", $sformatf("insn_regs_write queue[0] addr=0x%0x, value=0x%0x", insn_regs_write_addr, insn_regs_write_value), UVM_DEBUG)
      end

      // Ignore insn_regs_write_addr=0 just like in riscv_tracer.sv
      for (idx=0; idx<32; idx++) begin
         compared_str = $sformatf("GPR[%0d]", idx);
`ifdef ISS_SPIKE
         if ((idx == insn_regs_write_addr) && (idx != 0) && (insn_regs_write_size == 1)) begin
            if (rvviRefGprsCompare(idx, insn_regs_write_value) != 0) begin
               print_mismatch_history($sformatf("GPR[%0d] Mismatch with Spike. Spike: 0x%08x RTL: 0x%08x", idx, rvviRefGetGpr(idx), insn_regs_write_value));
            end
         end
         else if (!is_stall_sim && !`CV32E40P_TRACER.insn_wb_bypass) begin
            if (rvviRefGprsCompare(idx, step_compare_if.riscy_GPR[idx]) != 0) begin
               print_mismatch_history($sformatf("GPR[%0d] Mismatch with Spike. Spike: 0x%08x RTL: 0x%08x", idx, rvviRefGetGpr(idx), step_compare_if.riscy_GPR[idx]));
            end
         end
`else
         if ((idx == insn_regs_write_addr) && (idx != 0) && (insn_regs_write_size == 1)) // Use register in insn_regs_write queue if it exists
            check_32bit(.compared(compared_str), .expected(step_compare_if.ovp_cpu_GPR[idx][31:0]), .actual(insn_regs_write_value));
         // FIXME:strichmo:I am removing the static (non-written) register checks, as they fail in presence of I and D bus RAM stalls
         // It would be highly desirable to find an alternative for this type of check to ensure unintended writes to do not
         else if (!is_stall_sim && !`CV32E40P_TRACER.insn_wb_bypass) // Use actual value from RTL to compare registers which should have not changed
            check_32bit(.compared(compared_str), .expected(step_compare_if.ovp_cpu_GPR[idx][31:0]), .actual(step_compare_if.riscy_GPR[idx]));
`endif
         step_compare_if.num_gpr_checks++;
      end

      // Compare CSR's
`ifdef ISS_SPIKE
      if (!is_stall_sim) begin
         if (step_compare_if.deferint_prime != 0) begin
            if (rvviRefCsrCompare(12'h300, {`CV32E40P_CORE.cs_registers_i.mstatus_q.mprv, 4'b0, `CV32E40P_CORE.cs_registers_i.mstatus_q.mpp, 3'b0, `CV32E40P_CORE.cs_registers_i.mstatus_q.mpie, 2'b0, `CV32E40P_CORE.cs_registers_i.mstatus_q.upie, `CV32E40P_CORE.cs_registers_i.mstatus_q.mie, 2'b0, `CV32E40P_CORE.cs_registers_i.mstatus_q.uie}) != 0) begin print_mismatch_history($sformatf("mstatus CSR Mismatch. Spike: 0x%08x", rvviRefGetCsr(12'h300))); end
            if (rvviRefCsrCompare(12'h341, `CV32E40P_CORE.cs_registers_i.mepc_q) != 0) begin print_mismatch_history($sformatf("mepc CSR Mismatch. Spike: 0x%08x RTL: 0x%08x", rvviRefGetCsr(12'h341), `CV32E40P_CORE.cs_registers_i.mepc_q)); end
            if (rvviRefCsrCompare(12'h342, {`CV32E40P_CORE.cs_registers_i.mcause_q[5], 26'b0, `CV32E40P_CORE.cs_registers_i.mcause_q[4:0]}) != 0) begin print_mismatch_history($sformatf("mcause CSR Mismatch. Spike: 0x%08x", rvviRefGetCsr(12'h342))); end
            step_compare_if.num_csr_checks += 3;
         end
         if (rvviRefCsrCompare(12'h305, {`CV32E40P_CORE.cs_registers_i.mtvec_q, 6'h0, `CV32E40P_CORE.cs_registers_i.mtvec_mode_q}) != 0) begin print_mismatch_history($sformatf("mtvec CSR Mismatch. Spike: 0x%08x", rvviRefGetCsr(12'h305))); end
         if (rvviRefCsrCompare(12'h340, `CV32E40P_CORE.cs_registers_i.mscratch_q) != 0) begin print_mismatch_history($sformatf("mscratch CSR Mismatch. Spike: 0x%08x RTL: 0x%08x", rvviRefGetCsr(12'h340), `CV32E40P_CORE.cs_registers_i.mscratch_q)); end
         
         if (rvviRefCsrCompare(12'h304, `CV32E40P_CORE.cs_registers_i.mie_q) != 0) begin print_mismatch_history($sformatf("mie CSR Mismatch. Spike: 0x%08x RTL: 0x%08x", rvviRefGetCsr(12'h304), `CV32E40P_CORE.cs_registers_i.mie_q)); end
         if (rvviRefCsrCompare(12'h344, `CV32E40P_CORE.cs_registers_i.mip) != 0) begin print_mismatch_history($sformatf("mip CSR Mismatch. Spike: 0x%08x RTL: 0x%08x", rvviRefGetCsr(12'h344), `CV32E40P_CORE.cs_registers_i.mip)); end
         if (rvviRefCsrCompare(12'hCD2, 32'h0) != 0) begin print_mismatch_history($sformatf("zfinx CSR Mismatch. Spike: 0x%08x", rvviRefGetCsr(12'hCD2))); end
         
         if (`CV32E40P_CORE.cs_registers_i.PULP_XPULP) begin
            if (rvviRefCsrCompare(12'hCC0, `CV32E40P_CORE.cs_registers_i.hwlp_start_i[0]) != 0) begin print_mismatch_history($sformatf("lpstart0 CSR Mismatch. Spike: 0x%08x", rvviRefGetCsr(12'hCC0))); end
            if (rvviRefCsrCompare(12'hCC1, `CV32E40P_CORE.cs_registers_i.hwlp_end_i[0]) != 0) begin print_mismatch_history($sformatf("lpend0 CSR Mismatch. Spike: 0x%08x", rvviRefGetCsr(12'hCC1))); end
            if (rvviRefCsrCompare(12'hCC2, `CV32E40P_CORE.cs_registers_i.hwlp_cnt_i[0]) != 0) begin print_mismatch_history($sformatf("lpcount0 CSR Mismatch. Spike: 0x%08x", rvviRefGetCsr(12'hCC2))); end
            if (rvviRefCsrCompare(12'hCC4, `CV32E40P_CORE.cs_registers_i.hwlp_start_i[1]) != 0) begin print_mismatch_history($sformatf("lpstart1 CSR Mismatch. Spike: 0x%08x", rvviRefGetCsr(12'hCC4))); end
            if (rvviRefCsrCompare(12'hCC5, `CV32E40P_CORE.cs_registers_i.hwlp_end_i[1]) != 0) begin print_mismatch_history($sformatf("lpend1 CSR Mismatch. Spike: 0x%08x", rvviRefGetCsr(12'hCC5))); end
            if (rvviRefCsrCompare(12'hCC6, `CV32E40P_CORE.cs_registers_i.hwlp_cnt_i[1]) != 0) begin print_mismatch_history($sformatf("lpcount1 CSR Mismatch. Spike: 0x%08x", rvviRefGetCsr(12'hCC6))); end
            if (rvviRefCsrCompare(12'hCD0, `CV32E40P_CORE.cs_registers_i.hart_id_i) != 0) begin print_mismatch_history($sformatf("uhartid CSR Mismatch. Spike: 0x%08x", rvviRefGetCsr(12'hCD0))); end
            if (rvviRefCsrCompare(12'hCD1, {30'h0, `CV32E40P_CORE.cs_registers_i.priv_lvl_q}) != 0) begin print_mismatch_history($sformatf("privlv CSR Mismatch. Spike: 0x%08x", rvviRefGetCsr(12'hCD1))); end
            step_compare_if.num_csr_checks += 8;
         end
         
         step_compare_if.num_csr_checks += 5;
      end else begin
         // Increment the checks even if we skip them to avoid "CSR was checked 0 times!" UVM_ERROR.
         // This matches the behavior of the Imperas ISS branch.
         step_compare_if.num_csr_checks += 8 + (`CV32E40P_CORE.cs_registers_i.PULP_XPULP ? 8 : 0);
      end
`else
      foreach(`CV32E40P_RM_RVVI_STATE.csr[index]) begin
          step_compare_if.num_csr_checks++;
          ignore = 0;
          csr_val = 0;

          // CSR timing at instruction retirement is not completely deterministic in this simple model in presence of OBI stalls
          if (is_stall_sim)
          ignore = 1;
          case (index)

            "marchid"       : csr_val = cv32e40p_pkg::MARCHID; // warning!  defined in cv32e40p_pkg

            "mcountinhibit" : csr_val = `CV32E40P_CORE.cs_registers_i.mcountinhibit_q;

            "mvendorid"     : csr_val = {cv32e40p_pkg::MVENDORID_BANK, cv32e40p_pkg::MVENDORID_OFFSET};
            "mstatus"       : if (step_compare_if.deferint_prime == 0) ignore = 1;
                              else csr_val = {`CV32E40P_CORE.cs_registers_i.mstatus_q.mprv, // Not documented in Rev 4.5 of user_manual.doc but is in the design
                                        4'b0,
                                        `CV32E40P_CORE.cs_registers_i.mstatus_q.mpp,
                                        3'b0,
                                        `CV32E40P_CORE.cs_registers_i.mstatus_q.mpie,
                                        2'b0,
                                        `CV32E40P_CORE.cs_registers_i.mstatus_q.upie,
                                        `CV32E40P_CORE.cs_registers_i.mstatus_q.mie,
                                        2'b0,
                                        `CV32E40P_CORE.cs_registers_i.mstatus_q.uie};
            "misa"          : csr_val = `CV32E40P_CORE.cs_registers_i.MISA_VALUE;
            "mie"           : csr_val = `CV32E40P_CORE.cs_registers_i.mie_q;
            "mtvec"         : csr_val = {`CV32E40P_CORE.cs_registers_i.mtvec_q, 6'h0, `CV32E40P_CORE.cs_registers_i.mtvec_mode_q};
            "mscratch"      : csr_val = `CV32E40P_CORE.cs_registers_i.mscratch_q;
            "mepc"          : if (step_compare_if.deferint_prime == 0) ignore = 1;
                              else csr_val = `CV32E40P_CORE.cs_registers_i.mepc_q;
            "mcause"        : if (step_compare_if.deferint_prime == 0) ignore = 1;
                              else csr_val = {`CV32E40P_CORE.cs_registers_i.mcause_q[5],
                                              26'b0,
                                              `CV32E40P_CORE.cs_registers_i.mcause_q[4:0]};
          //  "mip"           : if (step_compare_if.deferint_prime == 0 || iss_wrap.io.deferint == 0) ignore = 1;
          //                    else csr_val = `CV32E40P_CORE.cs_registers_i.mip;
            "mip"           : ignore = 1;
            "mhartid"       : csr_val = `CV32E40P_CORE.cs_registers_i.hart_id_i;

            // only valid in DEBUG Mode
            "dcsr"          : begin
                              csr_val = `CV32E40P_CORE.cs_registers_i.dcsr_q;
                              if (iss_wrap.io.DM==0) ignore = 1;
            end
            "dpc"           : begin
                              csr_val = `CV32E40P_CORE.cs_registers_i.depc_q;
                              if (iss_wrap.io.DM==0) ignore = 1;
                              if (ignore_dpc_check) ignore = 1;
            end

            "dscratch0"     : csr_val = `CV32E40P_CORE.cs_registers_i.dscratch0_q;
            "dscratch1"     : csr_val = `CV32E40P_CORE.cs_registers_i.dscratch1_q;
            "pmpcfg0"       : csr_val = `CV32E40P_CORE.cs_registers_i.pmp_reg_q.pmpcfg_packed[0];
            "pmpcfg1"       : csr_val = `CV32E40P_CORE.cs_registers_i.pmp_reg_q.pmpcfg_packed[1];
            "pmpcfg2"       : csr_val = `CV32E40P_CORE.cs_registers_i.pmp_reg_q.pmpcfg_packed[2];
            "pmpcfg3"       : csr_val = `CV32E40P_CORE.cs_registers_i.pmp_reg_q.pmpcfg_packed[3];
            "tselect"       : csr_val = 32'h0000_0000;
            "tdata1"        : csr_val = `CV32E40P_CORE.cs_registers_i.tmatch_control_rdata;
            "tdata2"        : csr_val = `CV32E40P_CORE.cs_registers_i.tmatch_value_rdata;
            "tdata3"        : csr_val = 32'h0000_0000;
            "tinfo"         : csr_val = `CV32E40P_CORE.cs_registers_i.tinfo_types;

            "time"          : ignore  = 1;

            "mcontext"      : ignore  = 1;
            "scontext"      : ignore  = 1;

            "cycle"         : ignore  = 1;
            "cycleh"        : ignore  = 1;
            "instret"       : ignore  = 1;
            "instreth"      : ignore  = 1;
            "minstret"      : ignore  = 1;
            "minstreth"     : ignore  = 1;

            "mimpid"        : ignore  = 1;

            "hpmcounter3"   : ignore  = 1;
            "hpmcounter4"   : ignore  = 1;
            "hpmcounter5"   : ignore  = 1;
            "hpmcounter6"   : ignore  = 1;
            "hpmcounter7"   : ignore  = 1;
            "hpmcounter8"   : ignore  = 1;
            "hpmcounter9"   : ignore  = 1;
            "hpmcounter10"  : ignore  = 1;
            "hpmcounter11"  : ignore  = 1;
            "hpmcounter12"  : ignore  = 1;
            "hpmcounter13"  : ignore  = 1;
            "hpmcounter14"  : ignore  = 1;
            "hpmcounter15"  : ignore  = 1;
            "hpmcounter16"  : ignore  = 1;
            "hpmcounter17"  : ignore  = 1;
            "hpmcounter18"  : ignore  = 1;
            "hpmcounter19"  : ignore  = 1;
            "hpmcounter20"  : ignore  = 1;
            "hpmcounter21"  : ignore  = 1;
            "hpmcounter22"  : ignore  = 1;
            "hpmcounter23"  : ignore  = 1;
            "hpmcounter24"  : ignore  = 1;
            "hpmcounter25"  : ignore  = 1;
            "hpmcounter26"  : ignore  = 1;
            "hpmcounter27"  : ignore  = 1;
            "hpmcounter28"  : ignore  = 1;
            "hpmcounter29"  : ignore  = 1;
            "hpmcounter30"  : ignore  = 1;
            "hpmcounter31"  : ignore  = 1;

            "hpmcounterh3"  : ignore  = 1;
            "hpmcounterh4"  : ignore  = 1;
            "hpmcounterh5"  : ignore  = 1;
            "hpmcounterh6"  : ignore  = 1;
            "hpmcounterh7"  : ignore  = 1;
            "hpmcounterh8"  : ignore  = 1;
            "hpmcounterh9"  : ignore  = 1;
            "hpmcounterh10" : ignore  = 1;
            "hpmcounterh11" : ignore  = 1;
            "hpmcounterh12" : ignore  = 1;
            "hpmcounterh13" : ignore  = 1;
            "hpmcounterh14" : ignore  = 1;
            "hpmcounterh15" : ignore  = 1;
            "hpmcounterh16" : ignore  = 1;
            "hpmcounterh17" : ignore  = 1;
            "hpmcounterh18" : ignore  = 1;
            "hpmcounterh19" : ignore  = 1;
            "hpmcounterh20" : ignore  = 1;
            "hpmcounterh21" : ignore  = 1;
            "hpmcounterh22" : ignore  = 1;
            "hpmcounterh23" : ignore  = 1;
            "hpmcounterh24" : ignore  = 1;
            "hpmcounterh25" : ignore  = 1;
            "hpmcounterh26" : ignore  = 1;
            "hpmcounterh27" : ignore  = 1;
            "hpmcounterh28" : ignore  = 1;
            "hpmcounterh29" : ignore  = 1;
            "hpmcounterh30" : ignore  = 1;
            "hpmcounterh31" : ignore  = 1;

            "mhpmcounter3"  : ignore  = 1;
            "mhpmcounter4"  : ignore  = 1;
            "mhpmcounter5"  : ignore  = 1;
            "mhpmcounter6"  : ignore  = 1;
            "mhpmcounter7"  : ignore  = 1;
            "mhpmcounter8"  : ignore  = 1;
            "mhpmcounter9"  : ignore  = 1;
            "mhpmcounter10" : ignore  = 1;
            "mhpmcounter11" : ignore  = 1;
            "mhpmcounter12" : ignore  = 1;
            "mhpmcounter13" : ignore  = 1;
            "mhpmcounter14" : ignore  = 1;
            "mhpmcounter15" : ignore  = 1;
            "mhpmcounter16" : ignore  = 1;
            "mhpmcounter17" : ignore  = 1;
            "mhpmcounter18" : ignore  = 1;
            "mhpmcounter19" : ignore  = 1;
            "mhpmcounter20" : ignore  = 1;
            "mhpmcounter21" : ignore  = 1;
            "mhpmcounter22" : ignore  = 1;
            "mhpmcounter23" : ignore  = 1;
            "mhpmcounter24" : ignore  = 1;
            "mhpmcounter25" : ignore  = 1;
            "mhpmcounter26" : ignore  = 1;
            "mhpmcounter27" : ignore  = 1;
            "mhpmcounter28" : ignore  = 1;
            "mhpmcounter29" : ignore  = 1;
            "mhpmcounter30" : ignore  = 1;
            "mhpmcounter31" : ignore  = 1;

            "mhpmcounterh3" : ignore  = 1;
            "mhpmcounterh4" : ignore  = 1;
            "mhpmcounterh5" : ignore  = 1;
            "mhpmcounterh6" : ignore  = 1;
            "mhpmcounterh7" : ignore  = 1;
            "mhpmcounterh8" : ignore  = 1;
            "mhpmcounterh9" : ignore  = 1;
            "mhpmcounterh10": ignore  = 1;
            "mhpmcounterh11": ignore  = 1;
            "mhpmcounterh12": ignore  = 1;
            "mhpmcounterh13": ignore  = 1;
            "mhpmcounterh14": ignore  = 1;
            "mhpmcounterh15": ignore  = 1;
            "mhpmcounterh16": ignore  = 1;
            "mhpmcounterh17": ignore  = 1;
            "mhpmcounterh18": ignore  = 1;
            "mhpmcounterh19": ignore  = 1;
            "mhpmcounterh20": ignore  = 1;
            "mhpmcounterh21": ignore  = 1;
            "mhpmcounterh22": ignore  = 1;
            "mhpmcounterh23": ignore  = 1;
            "mhpmcounterh24": ignore  = 1;
            "mhpmcounterh25": ignore  = 1;
            "mhpmcounterh26": ignore  = 1;
            "mhpmcounterh27": ignore  = 1;
            "mhpmcounterh28": ignore  = 1;
            "mhpmcounterh29": ignore  = 1;
            "mhpmcounterh30": ignore  = 1;
            "mhpmcounterh31": ignore  = 1;

            default: begin
              `uvm_error("STEP_COMPARE", $sformatf("index=%s does not match a CSR name", index))
              ignore = 1;
            end
          endcase // case (index)

          if (!ignore)
            check_32bit(.compared(index), .expected(`CV32E40P_RM_RVVI_STATE.csr[index]), .actual(csr_val));

      end // foreach (ovp.cpu.csr[index])
`endif
    endfunction // compare

    int cycles = 0;
    always @(posedge `CV32E40P_CORE.clk) begin
        cycles++;
    end

    // RTL->RM CSR : mcycle, minstret, mcycleh, minstreth
                                                         // Waiving Verissimo SVTB.32.2.0: Pass strings by reference unless otherwise needed
    function automatic void pushRTL2RM(string message);  //@DVT_LINTER_WAIVER "MT20211228_2" disable SVTB.32.2.0
        logic [ 5:0] gpr_addr;
        logic [31:0] gpr_value;

`ifdef ISS_IMPERAS
        if (`CV32E40P_TRACER.insn_regs_write.size()) begin
          gpr_addr  = `CV32E40P_TRACER.insn_regs_write[0].addr;
          gpr_value = `CV32E40P_TRACER.insn_regs_write[0].value;
          `CV32E40P_RM.state.GPR_rtl[gpr_addr] = gpr_value;
        end
        // Pass cycles and reset
        `CV32E40P_RM.cycles = cycles;
        cycles = 0;
`endif
    endfunction // pushRTL2RM

   always @(step_compare_if.riscv_trap) begin
`ifdef ISS_SPIKE
      int cause;
      int tval;
      int epc;
      // In CV32E40P, mcause_q bit 5 is interrupt flag, bits 4:0 are exception code
      cause = (`CV32E40P_CORE.cs_registers_i.mcause_q[5] << 31) | `CV32E40P_CORE.cs_registers_i.mcause_q[4:0];
      epc = `CV32E40P_CORE.cs_registers_i.mepc_q;
      // CV32E40P doesn't implement mtval_q natively. Pass 0 for standard exceptions and insn_pc for breakpoints.
      if ((cause & 31'h7FFFFFFF) == 3) begin // Breakpoint
         tval = step_compare_if.insn_pc;
      end else begin
         tval = 0;
      end
      
      rvviRefInjectTrap(cause, epc, tval);
`endif
   end

   always @(step_compare_if.riscv_retire) begin
      bit is_dret;
      bit is_stepie;
      bit is_stepping;
      bit [31:0] irq_fwd_val;
      // check expected against actual
      if (use_iss) begin
`ifdef ISS_SPIKE
         rvviRefSyncPerfCounters(
             `CV32E40P_CORE.cs_registers_i.mhpmcounter_q[0][31:0],
             `CV32E40P_CORE.cs_registers_i.mhpmcounter_q[2][31:0]
         );
          rvviRefEventStep(step_compare_if.insn_pc);

          // On Imperas, we have the following logic that controls interrupt delivery:
          // iss_wrap.io.irq_i = iss_wrap.io.deferint ? dut_wrap.irq :
          //                     !deferint_ack ? irq_deferint_ack :
          //                     irq_deferint_sleep;
          //
          // We mimic this exact behavior for Spike. step_compare_if.deferint_prime drops
          // to 0 exactly when the RTL ID stage commits to an interrupt.
          // By conditionally passing irq_mip only when deferint_prime == 0, we prevent Spike
          // from evaluating and taking interrupts prematurely (e.g., during the 1-instruction
          // interrupt shadow following an `mret` instruction where RTL mstatus.MIE hasn't updated,
          // such as instruction 0x5da).
          //
          // ---------------------------------------------------------------------------------------
          // 1. IS_DRET SIGNAL:
          // RISC-V 32-bit machine-code opcode for dret (Debug Return) instruction is 32'h7B200073.
          // We also verify `CV32E40P_CORE.debug_mode` to ensure dret is executing validly inside Debug Mode
          // (executing 0x7B200073 in Machine/User mode outside debug mode is illegal and does NOT exit debug mode).
          //
          // NOTE: this must be sourced from the tracer's retirement-valid instruction word
          // (tracer_i.insn_val), not the live ID-stage instruction register
          // (id_stage_i.instr_rdata_i). The ID stage runs several cycles ahead of whichever
          // instruction is actually retiring in Write-Back when riscv_retire fires, so sampling
          // instr_rdata_i here can flag is_dret true on a retire pulse that has nothing to do with
          // dret's own retirement -- causing irq_mip to be forwarded to Spike one retirement early
          // and Spike to take a pending interrupt before executing the single-stepped instruction
          // the RTL retires normally (see session_2_walkthrough.md item #16, and debug.rst
          // "Interrupts during Single-Step Behavior"). step_compare_if.riscv_retire is itself
          // driven directly off tracer_i.retire (uvmt_cv32e40p_tb.sv), so insn_val is guaranteed
          // valid for the currently-retiring instruction at this point.
          // ---------------------------------------------------------------------------------------
          is_dret = `CV32E40P_CORE.debug_mode &&
                    ($root.uvmt_cv32e40p_tb.dut_wrap.cv32e40p_wrapper_i.tracer_i.insn_val == 32'h7b200073);

          // ---------------------------------------------------------------------------------------
          // 2. IS_STEPIE / IS_STEPPING SIGNALS:
          // `dcsr.stepie` (bit 11) controls whether interrupts are enabled during single stepping,
          // per debug.rst "Interrupts during Single-Step Behavior" -- this bit's defined effect is
          // scoped to when the core is actually mid single-step session (`dcsr.step`, bit 2, == 1).
          // When stepping and stepie == 1, interrupts remain active while stepping and trap as
          // normal upon dret. `dcsr.step`/`dcsr.stepie` are both read from cs_registers_i.dcsr_q,
          // valid at this retirement boundary the same way is_dret's tracer-sourced signal is.
          // ---------------------------------------------------------------------------------------
          is_stepie    = `CV32E40P_CORE.cs_registers_i.dcsr_q.stepie;
          is_stepping  = `CV32E40P_CORE.cs_registers_i.dcsr_q.step;

          // ---------------------------------------------------------------------------------------
          // 3. DEBUG-MODE INTERRUPT SYNCHRONIZATION:
          // Per exceptions_interrupts.rst: "In Debug Mode, all interrupts are ignored independent
          // of mstatus.MIE and the content of the mie CSR." Masking is solely a function of
          // debug_mode -- unlike `mret`, `dret` does not restore any CSR in the WB stage, so there
          // is no pipeline-timing shadow: the RTL evaluates and takes a pending interrupt on the
          // instruction immediately following dret's retirement, with zero shadow instructions
          // (confirmed in trace_core_00000000.log: 0x1a110d28 dret is directly followed by 0x78,
          // the interrupt handler, with no intervening PC -- e.g. Test 19 "irq in debug").
          // `dcsr.stepie` only has a defined effect while `dcsr.step == 1` (an active single-step
          // session, e.g. Test 18's step_info=5/6 sub-cases); it must not gate interrupt delivery
          // after a plain (non-stepping) debug_req_i halt/resume, where it may hold an unrelated
          // leftover value from a prior test (see debugger.S _debugger_single_step_disable, which
          // clears both step and stepie at the end of Test 18, ahead of Test 19).
          // Because dret retired inside Debug ROM, deferint_prime remains 1. If we only checked
          // (deferint_prime == 0), Spike's mip would be cleared to 0, causing a PC mismatch.
          // Therefore, when is_dret is true and we are either not mid single-step or stepie is
          // set, we forward irq_mip to Spike so Spike evaluates and takes the pending interrupt on
          // the next step in lockstep with RTL.
          // ---------------------------------------------------------------------------------------
          irq_fwd_val = (step_compare_if.deferint_prime == 1'b0 ||
                         (is_dret && (!is_stepping || is_stepie))) ? $root.uvmt_cv32e40p_tb.irq_mip : 32'b0;

          // ---------------------------------------------------------------------------------------
          // DEBUG INSTRUMENTATION: dump every control signal feeding the dret/interrupt gating
          // logic above for every retire inside the debug_test single_step region (single_step.S,
          // ~0x00012f00-0x000130c0) and inside the Debug ROM (dm_halt_addr .. +0x1000). This is the
          // exact window covering session_2_walkthrough.md item #16 / Test 18 (Single stepping).
          // ---------------------------------------------------------------------------------------
          if ((step_compare_if.insn_pc >= 32'h00012f00 && step_compare_if.insn_pc <= 32'h000130c0) ||
              (step_compare_if.insn_pc >= $root.uvmt_cv32e40p_tb.core_cntrl_if.dm_halt_addr &&
               step_compare_if.insn_pc <  $root.uvmt_cv32e40p_tb.core_cntrl_if.dm_halt_addr + 32'h1000)) begin
             //$display("[SV DEBUG retire] time=%0t pc=0x%08x insn_val=0x%08x id_instr_rdata=0x%08x is_dret=%b is_stepie=%b deferint_prime=%b irq_mip=0x%08x fwd_irq=0x%08x debug_mode=%b dcsr.step=%b dcsr.cause=%0d dcsr.stepie=%b",
              //         $time, step_compare_if.insn_pc, `CV32E40P_TRACER.insn_val,
               //        `CV32E40P_CORE.id_stage_i.instr_rdata_i, is_dret, is_stepie,
                //       step_compare_if.deferint_prime, $root.uvmt_cv32e40p_tb.irq_mip, irq_fwd_val,
                //       `CV32E40P_CORE.debug_mode, `CV32E40P_CORE.cs_registers_i.dcsr_q.step,
                 //      `CV32E40P_CORE.cs_registers_i.dcsr_q.cause, `CV32E40P_CORE.cs_registers_i.dcsr_q.stepie);
          end

          rvviRefSyncIrq(irq_fwd_val);
`endif
         compare();
      end
   end

    /*
        The schedule works like this
        1. Run the RTL for 1 instruction retirement
        2. if the RTL.RetiredPC == OVP.NextPC
           then run OVP for 1 instruction retirement
        3. Compare RTL <-> OVP
    */
    event ev_compare;
    static int instruction_count = 0;

    typedef enum {
        INIT,
        IDLE,  // Needed to get an event on state so always block is initially entered

        RTL_STEP,
        RTL_VALID,
        RTL_TRAP,
        RTL_HALT,

        RM_STEP,
        RM_VALID,
        RM_TRAP,
        RM_HALT,

        CMP
    } state_e;

   state_e state = INIT;
   initial state <= IDLE; // cause an event for always @*

   always @(*) begin
     if (use_iss) begin
        case (state)
          IDLE: begin
              state <= RTL_STEP;
          end

          RTL_STEP: begin
              clknrst_if.start_clk();
              fork
                  begin
                      @step_compare_if.riscv_retire;
                      clknrst_if.stop_clk();
                      state <= RTL_VALID;
                  end
                  begin
                      @step_compare_if.riscv_trap;
                      state <= RTL_TRAP;
                  end
                  begin
                      @step_compare_if.riscv_halt;
                      state <= RTL_HALT;
                  end
              join_any
              disable fork;
          end

          RTL_VALID: begin
`ifdef ISS_IMPERAS
              state <= RM_STEP;
`else
              state <= IDLE;
`endif
          end

          RTL_TRAP: begin
              //state <= RM_STEP; // TODO: RTL/RVVI needs additional work
              state <= RTL_STEP;
          end

          RTL_HALT: begin
              state <= RTL_STEP;
          end

          RM_STEP: begin
              pushRTL2RM("ret_rtl");
`ifdef ISS_IMPERAS
              `CV32E40P_RM_RVVI_CONTROL.stepi();
`endif
              fork
                  begin
                      @step_compare_if.ovp_cpu_valid;
                      ->`CV32E40P_TRACER.ovp_retire;
                      state <= RM_VALID;
                  end
                  begin
`ifdef ISS_IMPERAS
   always @(step_compare_if.ovp_cpu_trap) begin
       // TODO check exception against ISS
       $display("Trap!!");
   end
`endif
                      @step_compare_if.ovp_cpu_trap;
                      state <= RM_TRAP;
                  end
                  begin
                      @step_compare_if.ovp_cpu_halt;
                      state <= RM_HALT;
                  end
              join_any
              disable fork;
          end

          RM_VALID: begin
              state <= CMP;
          end

          RM_TRAP: begin
              //state <= CMP; // TODO: needs enabling after RTL/RVVI fix
              state <= RM_STEP;
          end

          RM_HALT: begin
              state <= RM_STEP;
          end

          CMP: begin
              compare();
              ->ev_compare;
              instruction_count += 1;
              //state <= RTL_STEP;
              state <= IDLE;
          end
        endcase // case (state)
     end
   end

   int global_retire_count = 0;

   always @(step_compare_if.riscv_retire) begin
      global_retire_count++;
      if ((global_retire_count % 250000) == 0) begin
         $display("[DEBUG] Successfully retired %0d instructions.", global_retire_count);
      end
   end

   always @(instruction_count) begin
      if (!(instruction_count % 10000)) begin
         `uvm_info("Step-and-Compare", $sformatf("Compared %0d instructions", instruction_count), UVM_NONE)
      end
      if (instruction_count >= 10_000_000) begin
         `uvm_fatal("Step-and-Compare", $sformatf("Compared %0d instructions - that's too long!", instruction_count))
      end
   end


`ifdef COVERAGE
   coverage cov1;
   initial begin
       cov1 = new();
   end

    function void split(input string in_s, output string s1, s2);
        automatic int i;
        for (i=0; i<in_s.len(); i++) begin
            if (in_s.getc(i) == ":")
                break;
         end
         if (i==0 ) begin
            `uvm_fatal("STEP COMPARE", $sformatf(": not found in split '%0s'", in_s))
         end
         s1 = in_s.substr(0,i-1);
         s2 = in_s.substr(i+1,in_s.len()-1);
    endfunction


    function automatic void sample();
        string decode = `CV32E40P_RM.Decode;
        string ins_str, op[4], key, val;
        int i;
        ins_t ins;
        int num = $sscanf (decode, "%s %s %s %s %s", ins_str, op[0], op[1], op[2], op[3]);
        ins.ins_str = ins_str;
        for (i=0; i<num-1; i++) begin
            split(op[i], key, val);
            ins.ops[i].key=key;
            ins.ops[i].val=val;
        end
        cov1.sample (ins);
    endfunction
`endif

endmodule: uvmt_cv32e40p_step_compare

`endif //__UVMT_CV32E40P_STEP_COMPARE_SV__

