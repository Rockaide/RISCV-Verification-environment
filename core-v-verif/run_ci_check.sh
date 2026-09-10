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
        echo "run_ci_check: Test PASSED: ${test_name} Log: ${log}"
    else
        echo "run_ci_check: Test FAILED: ${test_name} Log: ${log}"
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
echo "run_ci_check: Running build: [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make comp_corev-dv CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make comp_corev-dv CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike
popd > /dev/null

# Build:uvmt_cv32e40p 
echo "run_ci_check: Running build: [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make comp CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make comp CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike
popd > /dev/null

# --------------------------------------------------------------------------------------
# Tests
# --------------------------------------------------------------------------------------

# --> Test: corev_rand_arithmetic_base_test : Build: uvmt_cv32e40p : Generated corev-dv random arithmetic test
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_arithmetic_base_test : Generated corev-dv random arithmetic test
echo "run_ci_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_arithmetic_base_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_arithmetic_base_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_arithmetic_base_test/0/xrun-corev_rand_arithmetic_base_test.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_arithmetic_base_test
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_arithmetic_base_test : Generated corev-dv random arithmetic test
echo "run_ci_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_arithmetic_base_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_arithmetic_base_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_arithmetic_base_test/1/xrun-corev_rand_arithmetic_base_test.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_arithmetic_base_test
incr_test_counts

# --> Test: corev_rand_instr_test : Build: uvmt_cv32e40p : Generated corev-dv random instruction test
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_instr_test : Generated corev-dv random instruction test
echo "run_ci_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_instr_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_instr_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_instr_test/0/xrun-corev_rand_instr_test.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_instr_test
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_instr_test : Generated corev-dv random instruction test
echo "run_ci_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_instr_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_instr_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_instr_test/1/xrun-corev_rand_instr_test.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_instr_test
incr_test_counts

# --> Test: corev_rand_interrupt : Build: uvmt_cv32e40p : Interrupt random test
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_ci_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/0/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_ci_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/1/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts

# --> Test: corev_rand_jump_stress_test : Build: uvmt_cv32e40p : Generated corev-dv jump stress test
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_jump_stress_test : Generated corev-dv jump stress test
echo "run_ci_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_jump_stress_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_jump_stress_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_jump_stress_test/0/xrun-corev_rand_jump_stress_test.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_jump_stress_test
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_jump_stress_test : Generated corev-dv jump stress test
echo "run_ci_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_jump_stress_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_jump_stress_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_jump_stress_test/1/xrun-corev_rand_jump_stress_test.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_jump_stress_test
incr_test_counts

# --> Test: csr_instructions : Build: uvmt_cv32e40p : CSR Instruction Test
# --> Test (Index: 0): make test COREV=YES TEST=csr_instructions : CSR Instruction Test
echo "run_ci_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=csr_instructions CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=csr_instructions CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/csr_instructions/0/xrun-csr_instructions.log


failed=0
check_log ${log} "SIMULATION PASSED" csr_instructions
incr_test_counts

# --> Test: debug_test : Build: uvmt_cv32e40p : 
# --> Test (Index: 0): make test COREV=YES TEST=debug_test : 
echo "run_ci_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike CV_SW_MARCH=rv32imc_zicsr_zifencei]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike CV_SW_MARCH=rv32imc_zicsr_zifencei >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/0/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts

# --> Test: hello-world : Build: uvmt_cv32e40p : UVM Hello World Test
# --> Test (Index: 0): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_ci_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/0/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts

# --> Test: illegal : Build: uvmt_cv32e40p : 
# --> Test (Index: 0): make test COREV=YES TEST=illegal : 
echo "run_ci_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=illegal CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=illegal CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/illegal/0/xrun-illegal.log


failed=0
check_log ${log} "SIMULATION PASSED" illegal
incr_test_counts

# --> Test: interrupt_test : Build: uvmt_cv32e40p : Interrupt directed test
# --> Test (Index: 0): make test COREV=YES TEST=interrupt_test : Interrupt directed test
echo "run_ci_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=interrupt_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=interrupt_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/interrupt_test/0/xrun-interrupt_test.log


failed=0
check_log ${log} "SIMULATION PASSED" interrupt_test
incr_test_counts

# --> Test: riscv_arithmetic_basic_test_0 : Build: uvmt_cv32e40p : Static riscv-dv arithmetic test 0
# --> Test (Index: 0): make test COREV=YES TEST=riscv_arithmetic_basic_test_0 : Static riscv-dv arithmetic test 0
echo "run_ci_check: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=riscv_arithmetic_basic_test_0 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=riscv_arithmetic_basic_test_0 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/riscv_arithmetic_basic_test_0/0/xrun-riscv_arithmetic_basic_test_0.log


failed=0
check_log ${log} "SIMULATION PASSED" riscv_arithmetic_basic_test_0
incr_test_counts


echo "run_ci_check: Passing tests: ${pass_count}"
echo "run_ci_check: Failing tests: ${fail_count}"

if [ ${fail_count} -ne 0 ]; then
    exit 1
fi
exit 0