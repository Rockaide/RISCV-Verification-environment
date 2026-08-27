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
        echo "run_interrupt: Test PASSED: ${test_name} Log: ${log}"
    else
        echo "run_interrupt: Test FAILED: ${test_name} Log: ${log}"
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
echo "run_interrupt: Running build: [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make comp_corev-dv CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make comp_corev-dv CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=0  USE_ISS=YES ISS=spike
popd > /dev/null

# Build:uvmt_cv32e40p 
echo "run_interrupt: Running build: [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make comp CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make comp CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike
popd > /dev/null

# --------------------------------------------------------------------------------------
# Tests
# --------------------------------------------------------------------------------------

# --> Test: corev_rand_interrupt : Build: uvmt_cv32e40p : Interrupt random test
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/0/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/1/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 2): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/2/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 3): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/3/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 4): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/4/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 5): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/5/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 6): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/6/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 7): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/7/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 8): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/8/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 9): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/9/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 10): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/10/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 11): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/11/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 12): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/12/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 13): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/13/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 14): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/14/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 15): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/15/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 16): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/16/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 17): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/17/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 18): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/18/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 19): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/19/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 20): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/20/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 21): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/21/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 22): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/22/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 23): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/23/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 24): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/24/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 25): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/25/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 26): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/26/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 27): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/27/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 28): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/28/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 29): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/29/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 30): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/30/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 31): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/31/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 32): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/32/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 33): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/33/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 34): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/34/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 35): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/35/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 36): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/36/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 37): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/37/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 38): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/38/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 39): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/39/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 40): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/40/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 41): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/41/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 42): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/42/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 43): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/43/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 44): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/44/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 45): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/45/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 46): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/46/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 47): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/47/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 48): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/48/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts
# --> Test (Index: 49): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt : Interrupt random test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt/49/xrun-corev_rand_interrupt.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt
incr_test_counts

# --> Test: corev_rand_interrupt_debug : Build: uvmt_cv32e40p : Interrupt random test with debug
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/0/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/1/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 2): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/2/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 3): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/3/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 4): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/4/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 5): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/5/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 6): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/6/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 7): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/7/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 8): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/8/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 9): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/9/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 10): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/10/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 11): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/11/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 12): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/12/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 13): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/13/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 14): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/14/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 15): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/15/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 16): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/16/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 17): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/17/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 18): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/18/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 19): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/19/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 20): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/20/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 21): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/21/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 22): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/22/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 23): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/23/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 24): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/24/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 25): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/25/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 26): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/26/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 27): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/27/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 28): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/28/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 29): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/29/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 30): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/30/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 31): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/31/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 32): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/32/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 33): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/33/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 34): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/34/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 35): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/35/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 36): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/36/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 37): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/37/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 38): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/38/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 39): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/39/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 40): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/40/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 41): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/41/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 42): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/42/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 43): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/43/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 44): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/44/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 45): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/45/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 46): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/46/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 47): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/47/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 48): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/48/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts
# --> Test (Index: 49): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug : Interrupt random test with debug
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_debug/49/xrun-corev_rand_interrupt_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_debug
incr_test_counts

# --> Test: corev_rand_interrupt_exception : Build: uvmt_cv32e40p : Interrupt random test with exceptions
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/0/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/1/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 2): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/2/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 3): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/3/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 4): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/4/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 5): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/5/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 6): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/6/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 7): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/7/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 8): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/8/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 9): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/9/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 10): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/10/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 11): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/11/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 12): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/12/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 13): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/13/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 14): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/14/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 15): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/15/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 16): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/16/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 17): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/17/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 18): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/18/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 19): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/19/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 20): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/20/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 21): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/21/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 22): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/22/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 23): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/23/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 24): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/24/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 25): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/25/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 26): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/26/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 27): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/27/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 28): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/28/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 29): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/29/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 30): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/30/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 31): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/31/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 32): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/32/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 33): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/33/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 34): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/34/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 35): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/35/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 36): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/36/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 37): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/37/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 38): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/38/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 39): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/39/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 40): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/40/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 41): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/41/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 42): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/42/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 43): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/43/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 44): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/44/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 45): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/45/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 46): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/46/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 47): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/47/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 48): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/48/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts
# --> Test (Index: 49): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception : Interrupt random test with exceptions
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_exception CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_exception/49/xrun-corev_rand_interrupt_exception.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_exception
incr_test_counts

# --> Test: corev_rand_interrupt_nested : Build: uvmt_cv32e40p : Interrupt random test with nested interrupts and WFI
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/0/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/1/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 2): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/2/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 3): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/3/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 4): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/4/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 5): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/5/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 6): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/6/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 7): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/7/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 8): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/8/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 9): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/9/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 10): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/10/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 11): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/11/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 12): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/12/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 13): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/13/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 14): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/14/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 15): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/15/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 16): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/16/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 17): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/17/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 18): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/18/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 19): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/19/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 20): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/20/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 21): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/21/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 22): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/22/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 23): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/23/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 24): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/24/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 25): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/25/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 26): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/26/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 27): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/27/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 28): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/28/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 29): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/29/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 30): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/30/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 31): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/31/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 32): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/32/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 33): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/33/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 34): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/34/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 35): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/35/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 36): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/36/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 37): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/37/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 38): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/38/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 39): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/39/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 40): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/40/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 41): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/41/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 42): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/42/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 43): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/43/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 44): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/44/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 45): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/45/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 46): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/46/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 47): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/47/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 48): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/48/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts
# --> Test (Index: 49): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested : Interrupt random test with nested interrupts and WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_nested CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_nested/49/xrun-corev_rand_interrupt_nested.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_nested
incr_test_counts

# --> Test: corev_rand_interrupt_wfi : Build: uvmt_cv32e40p : Interrupt random test with WFI
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/0/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/1/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 2): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/2/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 3): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/3/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 4): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/4/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 5): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/5/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 6): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/6/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 7): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/7/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 8): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/8/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 9): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/9/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 10): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/10/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 11): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/11/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 12): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/12/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 13): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/13/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 14): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/14/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 15): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/15/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 16): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/16/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 17): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/17/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 18): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/18/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 19): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/19/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 20): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/20/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 21): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/21/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 22): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/22/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 23): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/23/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 24): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/24/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 25): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/25/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 26): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/26/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 27): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/27/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 28): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/28/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 29): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/29/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 30): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/30/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 31): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/31/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 32): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/32/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 33): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/33/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 34): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/34/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 35): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/35/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 36): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/36/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 37): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/37/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 38): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/38/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 39): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/39/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 40): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/40/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 41): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/41/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 42): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/42/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 43): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/43/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 44): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/44/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 45): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/45/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 46): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/46/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 47): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/47/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 48): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/48/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts
# --> Test (Index: 49): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi/49/xrun-corev_rand_interrupt_wfi.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi
incr_test_counts

# --> Test: corev_rand_interrupt_wfi_mem_stress : Build: uvmt_cv32e40p : Interrupt random test with WFI
# --> Test (Index: 0): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/0/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/1/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 2): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/2/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 3): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/3/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 4): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/4/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 5): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/5/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 6): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/6/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 7): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/7/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 8): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/8/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 9): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/9/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 10): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/10/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 11): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/11/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 12): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/12/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 13): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/13/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 14): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/14/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 15): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/15/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 16): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/16/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 17): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/17/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 18): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/18/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 19): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/19/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 20): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/20/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 21): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/21/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 22): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/22/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 23): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/23/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 24): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/24/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 25): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/25/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 26): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/26/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 27): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/27/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 28): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/28/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 29): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/29/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 30): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/30/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 31): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/31/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 32): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/32/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 33): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/33/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 34): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/34/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 35): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/35/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 36): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/36/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 37): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/37/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 38): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/38/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 39): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/39/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 40): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/40/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 41): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/41/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 42): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/42/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 43): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/43/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 44): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/44/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 45): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/45/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 46): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/46/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 47): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/47/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 48): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/48/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts
# --> Test (Index: 49): make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress : Interrupt random test with WFI
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test COREV=YES TEST=corev_rand_interrupt_wfi_mem_stress CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_interrupt_wfi_mem_stress/49/xrun-corev_rand_interrupt_wfi_mem_stress.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_interrupt_wfi_mem_stress
incr_test_counts

# --> Test: interrupt_bootstrap : Build: uvmt_cv32e40p : Interrupt directed bootstrap
# --> Test (Index: 0): make test COREV=YES TEST=interrupt_bootstrap : Interrupt directed bootstrap
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=interrupt_bootstrap CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=interrupt_bootstrap CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/interrupt_bootstrap/0/xrun-interrupt_bootstrap.log


failed=0
check_log ${log} "SIMULATION PASSED" interrupt_bootstrap
incr_test_counts

# --> Test: interrupt_test : Build: uvmt_cv32e40p : Interrupt directed test
# --> Test (Index: 0): make test COREV=YES TEST=interrupt_test : Interrupt directed test
echo "run_interrupt: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=interrupt_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=interrupt_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/interrupt_test/0/xrun-interrupt_test.log


failed=0
check_log ${log} "SIMULATION PASSED" interrupt_test
incr_test_counts


echo "run_interrupt: Passing tests: ${pass_count}"
echo "run_interrupt: Failing tests: ${fail_count}"

if [ ${fail_count} -ne 0 ]; then
    exit 1
fi
exit 0