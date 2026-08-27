#!/bin/bash

# --------------------------------------------------------------------------------------
# Variables
# --------------------------------------------------------------------------------------
pass_count=0
fail_count=0
failed=0

# --------------------------------------------------------------------------------------
# Functions
# --------------------------------------------------------------------------------------
check_log () {
    log=$1
    simulation_passed="$2"
    test_name=$3

    if grep -q "${simulation_passed}" ${log}; then
        echo "run_rel_check: Test PASSED: ${test_name} Log: ${log}"
    else
        echo "run_rel_check: Test FAILED: ${test_name} Log: ${log}"
        failed=1
    fi
}

incr_test_counts () {
    if [[ ${failed} == "0" ]]; then
        ((pass_count+=1))
    else
        ((fail_count+=1))
    fi
}

# --------------------------------------------------------------------------------------
# Builds
# --------------------------------------------------------------------------------------

# Build:corev-dv 
echo "run_rel_check: Running build: [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make comp_corev-dv CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make comp_corev-dv CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike
popd > /dev/null

# Build:uvmt_cv32e40p 
echo "run_rel_check: Running build: [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make comp CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make comp CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike
popd > /dev/null

# --------------------------------------------------------------------------------------
# Tests
# --------------------------------------------------------------------------------------

# --> Test: corev_rand_arithmetic_base_test : Build: uvmt_cv32e40p : Generated corev-dv arithmetic test
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_arithmetic_base_test : Generated corev-dv arithmetic test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_arithmetic_base_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_arithmetic_base_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_arithmetic_base_test/0/xrun-corev_rand_arithmetic_base_test.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_arithmetic_base_test
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_arithmetic_base_test : Generated corev-dv arithmetic test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_arithmetic_base_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_arithmetic_base_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_arithmetic_base_test/1/xrun-corev_rand_arithmetic_base_test.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_arithmetic_base_test
incr_test_counts

# --> Test: corev_rand_debug : Build: uvmt_cv32e40p : Generated corev-dv random debug test
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_debug : Generated corev-dv random debug test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/0/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_debug : Generated corev-dv random debug test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/1/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts

# --> Test: corev_rand_debug_ebreak : Build: uvmt_cv32e40p : debug random test with ebreaks from ROM
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_debug_ebreak : debug random test with ebreaks from ROM
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/0/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_debug_ebreak : debug random test with ebreaks from ROM
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/1/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts

# --> Test: corev_rand_debug_single_step : Build: uvmt_cv32e40p : debug random test with single-stepping
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_debug_single_step : debug random test with single-stepping
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/0/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_debug_single_step : debug random test with single-stepping
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/1/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts

# --> Test: corev_rand_illegal_instr_test : Build: uvmt_cv32e40p : Generated corev-dv random instruction test with illegal instructions
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_illegal_instr_test : Generated corev-dv random instruction test with illegal instructions
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_illegal_instr_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_illegal_instr_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_illegal_instr_test/0/xrun-corev_rand_illegal_instr_test.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_illegal_instr_test
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_illegal_instr_test : Generated corev-dv random instruction test with illegal instructions
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_illegal_instr_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_illegal_instr_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_illegal_instr_test/1/xrun-corev_rand_illegal_instr_test.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_illegal_instr_test
incr_test_counts

# --> Test: corev_rand_instr_test : Build: uvmt_cv32e40p : Generated corev-dv random instruction test
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_instr_test : Generated corev-dv random instruction test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_instr_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_instr_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_instr_test/0/xrun-corev_rand_instr_test.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_instr_test
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_instr_test : Generated corev-dv random instruction test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_instr_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_instr_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_instr_test/1/xrun-corev_rand_instr_test.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_instr_test
incr_test_counts

# --> Test: corev_rand_interrupt : Build: uvmt_cv32e40p : Generated corev-dv random interrupt test
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Generated corev-dv random interrupt test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/0/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Generated corev-dv random interrupt test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/1/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts

# --> Test: corev_rand_interrupt_debug : Build: uvmt_cv32e40p : Generated corev-dv random interrupt WFI test with debug
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Generated corev-dv random interrupt WFI test with debug
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/0/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Generated corev-dv random interrupt WFI test with debug
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/1/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts

# --> Test: corev_rand_interrupt_exception : Build: uvmt_cv32e40p : Generated corev-dv random interrupt WFI test with exceptions
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Generated corev-dv random interrupt WFI test with exceptions
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/0/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Generated corev-dv random interrupt WFI test with exceptions
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/1/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts

# --> Test: corev_rand_interrupt_nested : Build: uvmt_cv32e40p : Generated corev-dv random interrupt WFI test with random nested interrupts
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Generated corev-dv random interrupt WFI test with random nested interrupts
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/0/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Generated corev-dv random interrupt WFI test with random nested interrupts
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/1/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts

# --> Test: corev_rand_interrupt_wfi : Build: uvmt_cv32e40p : Generated corev-dv random interrupt WFI test
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Generated corev-dv random interrupt WFI test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/0/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Generated corev-dv random interrupt WFI test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/1/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts

# --> Test: corev_rand_jump_stress_test : Build: uvmt_cv32e40p : Generated corev-dv jump stress test
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_jump_stress_test : Generated corev-dv jump stress test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_jump_stress_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_jump_stress_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_jump_stress_test/0/xrun-corev_rand_jump_stress_test.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_jump_stress_test
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_jump_stress_test : Generated corev-dv jump stress test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_jump_stress_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_jump_stress_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_jump_stress_test/1/xrun-corev_rand_jump_stress_test.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_jump_stress_test
incr_test_counts

# --> Test: csr_instr_asm : Build: uvmt_cv32e40p : CSR instruction assembly test
# --> Test (Index: 0): make test COREV=YES TEST=csr_instr_asm : CSR instruction assembly test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=csr_instr_asm CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=csr_instr_asm CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/csr_instr_asm/0/xrun-csr_instr_asm.log


failed=0
check_log ${log} "SIMULATION PASSED" csr_instr_asm
incr_test_counts

# --> Test: csr_instructions : Build: uvmt_cv32e40p : CSR instruction test
# --> Test (Index: 0): make test COREV=YES TEST=csr_instructions : CSR instruction test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=csr_instructions CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=csr_instructions CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/csr_instructions/0/xrun-csr_instructions.log


failed=0
check_log ${log} "SIMULATION PASSED" csr_instructions
incr_test_counts

# --> Test: cv32e40p_csr_access_test : Build: uvmt_cv32e40p : Randomly generated CSR access test
# --> Test (Index: 0): make test COREV=YES TEST=cv32e40p_csr_access_test : Randomly generated CSR access test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=cv32e40p_csr_access_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=cv32e40p_csr_access_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/cv32e40p_csr_access_test/0/xrun-cv32e40p_csr_access_test.log


failed=0
check_log ${log} "SIMULATION PASSED" cv32e40p_csr_access_test
incr_test_counts

# --> Test: cv32e40p_readonly_csr_access_test : Build: uvmt_cv32e40p : Manually generated CSR access test of RO CSRs
# --> Test (Index: 0): make test COREV=YES TEST=cv32e40p_readonly_csr_access_test : Manually generated CSR access test of RO CSRs
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=cv32e40p_readonly_csr_access_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=cv32e40p_readonly_csr_access_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/cv32e40p_readonly_csr_access_test/0/xrun-cv32e40p_readonly_csr_access_test.log


failed=0
check_log ${log} "SIMULATION PASSED" cv32e40p_readonly_csr_access_test
incr_test_counts

# --> Test: debug_test : Build: uvmt_cv32e40p : Debug Test 1
# --> Test (Index: 0): make test COREV=YES TEST=debug_test : Debug Test 1
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/0/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts

# --> Test: debug_test_reset : Build: uvmt_cv32e40p : Debug reset test
# --> Test (Index: 0): make test COREV=YES TEST=debug_test_reset : Debug reset test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=debug_test_reset CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=debug_test_reset CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_reset/0/xrun-debug_test_reset.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_reset
incr_test_counts

# --> Test: dhrystone : Build: uvmt_cv32e40p : Dhrystone test
# --> Test (Index: 0): make test COREV=YES TEST=dhrystone : Dhrystone test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=dhrystone CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=dhrystone CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/dhrystone/0/xrun-dhrystone.log


failed=0
check_log ${log} "SIMULATION PASSED" dhrystone
incr_test_counts

# --> Test: fibonacci : Build: uvmt_cv32e40p : Fibonacci test
# --> Test (Index: 0): make test COREV=YES TEST=fibonacci : Fibonacci test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=fibonacci CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=fibonacci CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/fibonacci/0/xrun-fibonacci.log


failed=0
check_log ${log} "SIMULATION PASSED" fibonacci
incr_test_counts

# --> Test: generic_exception_test : Build: uvmt_cv32e40p : Generic exception test
# --> Test (Index: 0): make test COREV=YES TEST=generic_exception_test : Generic exception test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=generic_exception_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=generic_exception_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/generic_exception_test/0/xrun-generic_exception_test.log


failed=0
check_log ${log} "SIMULATION PASSED" generic_exception_test
incr_test_counts

# --> Test: hello-world : Build: uvmt_cv32e40p : uvm_hello_world_test
# --> Test (Index: 0): make test COREV=YES TEST=hello-world : uvm_hello_world_test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/0/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts

# --> Test: hpmcounter_basic_test : Build: uvmt_cv32e40p : Hardware performance counter basic test
# --> Test (Index: 0): make test COREV=YES TEST=hpmcounter_basic_test : Hardware performance counter basic test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hpmcounter_basic_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hpmcounter_basic_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hpmcounter_basic_test/0/xrun-hpmcounter_basic_test.log


failed=0
check_log ${log} "SIMULATION PASSED" hpmcounter_basic_test
incr_test_counts

# --> Test: hpmcounter_hazard_test : Build: uvmt_cv32e40p : Hardware performance counter hazard test
# --> Test (Index: 0): make test COREV=YES TEST=hpmcounter_hazard_test : Hardware performance counter hazard test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hpmcounter_hazard_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hpmcounter_hazard_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hpmcounter_hazard_test/0/xrun-hpmcounter_hazard_test.log


failed=0
check_log ${log} "SIMULATION PASSED" hpmcounter_hazard_test
incr_test_counts

# --> Test: illegal : Build: uvmt_cv32e40p : Illegal-riscv-tests
# --> Test (Index: 0): make test COREV=YES TEST=illegal : Illegal-riscv-tests
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=illegal CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=illegal CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/illegal/0/xrun-illegal.log


failed=0
check_log ${log} "SIMULATION PASSED" illegal
incr_test_counts

# --> Test: illegal_instr_test : Build: uvmt_cv32e40p : Illegal instruction test
# --> Test (Index: 0): make test COREV=YES TEST=illegal_instr_test : Illegal instruction test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=illegal_instr_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=illegal_instr_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/illegal_instr_test/0/xrun-illegal_instr_test.log


failed=0
check_log ${log} "SIMULATION PASSED" illegal_instr_test
incr_test_counts

# --> Test: interrupt_bootstrap : Build: uvmt_cv32e40p : Interrupt bootstrap test
# --> Test (Index: 0): make test COREV=YES TEST=interrupt_bootstrap : Interrupt bootstrap test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=interrupt_bootstrap CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=interrupt_bootstrap CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/interrupt_bootstrap/0/xrun-interrupt_bootstrap.log


failed=0
check_log ${log} "SIMULATION PASSED" interrupt_bootstrap
incr_test_counts

# --> Test: interrupt_test : Build: uvmt_cv32e40p : Interrupt test
# --> Test (Index: 0): make test COREV=YES TEST=interrupt_test : Interrupt test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=interrupt_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=interrupt_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/interrupt_test/0/xrun-interrupt_test.log


failed=0
check_log ${log} "SIMULATION PASSED" interrupt_test
incr_test_counts

# --> Test: isa_fcov_holes : Build: uvmt_cv32e40p : ISA function coverage test
# --> Test (Index: 0): make test COREV=YES TEST=isa_fcov_holes : ISA function coverage test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=isa_fcov_holes CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=isa_fcov_holes CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/isa_fcov_holes/0/xrun-isa_fcov_holes.log


failed=0
check_log ${log} "SIMULATION PASSED" isa_fcov_holes
incr_test_counts

# --> Test: misalign : Build: uvmt_cv32e40p : Misalign test
# --> Test (Index: 0): make test COREV=YES TEST=misalign : Misalign test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=misalign CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=misalign CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/misalign/0/xrun-misalign.log


failed=0
check_log ${log} "SIMULATION PASSED" misalign
incr_test_counts

# --> Test: modeled_csr_por : Build: uvmt_cv32e40p : Modeled CSR PoR test
# --> Test (Index: 0): make test COREV=YES TEST=modeled_csr_por : Modeled CSR PoR test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=modeled_csr_por CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=modeled_csr_por CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/modeled_csr_por/0/xrun-modeled_csr_por.log


failed=0
check_log ${log} "SIMULATION PASSED" modeled_csr_por
incr_test_counts

# --> Test: perf_counters_instructions : Build: uvmt_cv32e40p : Performance counter test
# --> Test (Index: 0): make test COREV=YES TEST=perf_counters_instructions : Performance counter test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=perf_counters_instructions CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=perf_counters_instructions CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/perf_counters_instructions/0/xrun-perf_counters_instructions.log


failed=0
check_log ${log} "SIMULATION PASSED" perf_counters_instructions
incr_test_counts

# --> Test: requested_csr_por : Build: uvmt_cv32e40p : CSR PoR test
# --> Test (Index: 0): make test COREV=YES TEST=requested_csr_por : CSR PoR test
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=requested_csr_por CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=requested_csr_por CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/requested_csr_por/0/xrun-requested_csr_por.log


failed=0
check_log ${log} "SIMULATION PASSED" requested_csr_por
incr_test_counts

# --> Test: riscv_arithmetic_basic_test_0 : Build: uvmt_cv32e40p : Static riscv-dv arithmetic test 0
# --> Test (Index: 0): make test COREV=YES TEST=riscv_arithmetic_basic_test_0 : Static riscv-dv arithmetic test 0
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=riscv_arithmetic_basic_test_0 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=riscv_arithmetic_basic_test_0 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/riscv_arithmetic_basic_test_0/0/xrun-riscv_arithmetic_basic_test_0.log


failed=0
check_log ${log} "SIMULATION PASSED" riscv_arithmetic_basic_test_0
incr_test_counts

# --> Test: riscv_arithmetic_basic_test_1 : Build: uvmt_cv32e40p : Static riscv-dv arithmetic test 1
# --> Test (Index: 0): make test COREV=YES TEST=riscv_arithmetic_basic_test_1 : Static riscv-dv arithmetic test 1
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=riscv_arithmetic_basic_test_1 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=riscv_arithmetic_basic_test_1 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/riscv_arithmetic_basic_test_1/0/xrun-riscv_arithmetic_basic_test_1.log


failed=0
check_log ${log} "SIMULATION PASSED" riscv_arithmetic_basic_test_1
incr_test_counts

# --> Test: riscv_ebreak_test_0 : Build: uvmt_cv32e40p : Static corev-dv ebreak
# --> Test (Index: 0): make test COREV=YES TEST=riscv_ebreak_test_0 : Static corev-dv ebreak
echo "run_rel_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=riscv_ebreak_test_0 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=riscv_ebreak_test_0 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/riscv_ebreak_test_0/0/xrun-riscv_ebreak_test_0.log


failed=0
check_log ${log} "SIMULATION PASSED" riscv_ebreak_test_0
incr_test_counts


echo "run_rel_check: Passing tests: ${pass_count}"
echo "run_rel_check: Failing tests: ${fail_count}"

if [ ${fail_count} -ne 0 ]; then
    exit 1
fi
exit 0