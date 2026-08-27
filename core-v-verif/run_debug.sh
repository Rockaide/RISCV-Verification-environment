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
        echo "run_debug: Test PASSED: ${test_name} Log: ${log}"
    else
        echo "run_debug: Test FAILED: ${test_name} Log: ${log}"
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
echo "run_debug: Running build: [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make comp_corev-dv CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make comp_corev-dv CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=0  USE_ISS=YES ISS=spike
popd > /dev/null

# Build:uvmt_cv32e40p 
echo "run_debug: Running build: [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make comp CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make comp CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike
popd > /dev/null

# --------------------------------------------------------------------------------------
# Tests
# --------------------------------------------------------------------------------------

# --> Test: corev_rand_debug : Build: uvmt_cv32e40p : debug random test
# --> Test (Index: 0): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/0/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/1/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 2): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/2/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 3): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/3/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 4): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/4/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 5): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/5/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 6): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/6/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 7): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/7/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 8): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/8/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 9): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/9/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 10): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/10/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 11): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/11/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 12): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/12/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 13): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/13/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 14): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/14/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 15): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/15/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 16): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/16/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 17): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/17/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 18): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/18/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 19): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/19/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 20): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/20/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 21): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/21/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 22): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/22/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 23): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/23/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 24): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/24/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 25): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/25/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 26): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/26/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 27): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/27/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 28): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/28/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 29): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/29/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 30): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/30/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 31): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/31/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 32): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/32/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 33): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/33/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 34): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/34/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 35): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/35/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 36): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/36/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 37): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/37/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 38): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/38/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 39): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/39/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 40): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/40/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 41): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/41/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 42): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/42/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 43): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/43/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 44): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/44/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 45): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/45/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 46): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/46/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 47): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/47/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 48): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/48/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts
# --> Test (Index: 49): make gen_corev-dv test TEST=corev_rand_debug : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug/49/xrun-corev_rand_debug.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug
incr_test_counts

# --> Test: corev_rand_debug_ebreak : Build: uvmt_cv32e40p : debug random test
# --> Test (Index: 0): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/0/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/1/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 2): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/2/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 3): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/3/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 4): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/4/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 5): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/5/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 6): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/6/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 7): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/7/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 8): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/8/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 9): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/9/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 10): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/10/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 11): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/11/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 12): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/12/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 13): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/13/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 14): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/14/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 15): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/15/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 16): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/16/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 17): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/17/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 18): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/18/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 19): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/19/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 20): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/20/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 21): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/21/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 22): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/22/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 23): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/23/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 24): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/24/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 25): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/25/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 26): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/26/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 27): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/27/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 28): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/28/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 29): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/29/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 30): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/30/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 31): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/31/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 32): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/32/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 33): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/33/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 34): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/34/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 35): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/35/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 36): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/36/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 37): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/37/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 38): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/38/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 39): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/39/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 40): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/40/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 41): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/41/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 42): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/42/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 43): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/43/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 44): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/44/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 45): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/45/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 46): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/46/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 47): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/47/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 48): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/48/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts
# --> Test (Index: 49): make gen_corev-dv test TEST=corev_rand_debug_ebreak : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_ebreak CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_ebreak/49/xrun-corev_rand_debug_ebreak.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_ebreak
incr_test_counts

# --> Test: corev_rand_debug_single_step : Build: uvmt_cv32e40p : debug random test
# --> Test (Index: 0): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/0/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 1): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/1/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 2): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/2/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 3): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/3/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 4): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/4/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 5): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/5/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 6): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/6/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 7): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/7/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 8): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/8/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 9): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/9/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 10): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/10/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 11): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/11/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 12): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/12/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 13): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/13/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 14): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/14/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 15): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/15/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 16): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/16/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 17): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/17/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 18): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/18/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 19): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/19/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 20): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/20/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 21): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/21/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 22): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/22/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 23): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/23/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 24): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/24/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 25): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/25/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 26): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/26/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 27): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/27/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 28): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/28/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 29): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/29/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 30): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/30/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 31): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/31/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 32): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/32/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 33): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/33/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 34): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/34/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 35): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/35/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 36): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/36/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 37): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/37/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 38): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/38/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 39): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/39/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 40): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/40/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 41): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/41/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 42): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/42/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 43): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/43/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 44): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/44/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 45): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/45/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 46): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/46/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 47): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/47/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 48): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/48/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts
# --> Test (Index: 49): make gen_corev-dv test TEST=corev_rand_debug_single_step : debug random test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make gen_corev-dv test TEST=corev_rand_debug_single_step CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/corev_rand_debug_single_step/49/xrun-corev_rand_debug_single_step.log


failed=0
check_log ${log} "SIMULATION PASSED" corev_rand_debug_single_step
incr_test_counts

# --> Test: debug_test : Build: uvmt_cv32e40p : Debug directed test
# --> Test (Index: 0): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/0/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts
# --> Test (Index: 1): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/1/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts
# --> Test (Index: 2): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/2/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts
# --> Test (Index: 3): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/3/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts
# --> Test (Index: 4): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/4/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts
# --> Test (Index: 5): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/5/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts
# --> Test (Index: 6): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/6/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts
# --> Test (Index: 7): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/7/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts
# --> Test (Index: 8): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/8/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts
# --> Test (Index: 9): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/9/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts
# --> Test (Index: 10): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/10/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts
# --> Test (Index: 11): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/11/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts
# --> Test (Index: 12): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/12/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts
# --> Test (Index: 13): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/13/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts
# --> Test (Index: 14): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/14/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts
# --> Test (Index: 15): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/15/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts
# --> Test (Index: 16): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/16/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts
# --> Test (Index: 17): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/17/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts
# --> Test (Index: 18): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/18/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts
# --> Test (Index: 19): make test TEST=debug_test : Debug directed test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test/19/xrun-debug_test.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test
incr_test_counts

# --> Test: debug_test_boot_set : Build: uvmt_cv32e40p : Debug reset test with random boot set
# --> Test (Index: 0): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/0/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 1): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/1/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 2): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/2/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 3): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/3/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 4): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/4/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 5): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/5/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 6): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/6/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 7): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/7/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 8): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/8/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 9): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/9/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 10): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/10/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 11): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/11/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 12): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/12/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 13): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/13/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 14): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/14/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 15): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/15/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 16): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/16/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 17): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/17/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 18): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/18/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 19): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/19/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 20): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/20/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 21): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/21/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 22): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/22/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 23): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/23/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 24): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/24/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 25): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/25/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 26): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/26/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 27): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/27/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 28): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/28/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 29): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/29/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 30): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/30/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 31): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/31/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 32): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/32/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 33): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/33/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 34): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/34/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 35): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/35/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 36): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/36/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 37): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/37/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 38): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/38/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 39): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/39/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 40): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/40/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 41): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/41/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 42): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/42/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 43): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/43/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 44): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/44/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 45): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/45/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 46): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/46/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 47): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/47/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 48): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/48/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts
# --> Test (Index: 49): make test TEST=debug_test_boot_set : Debug reset test with random boot set
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_boot_set CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_boot_set/49/xrun-debug_test_boot_set.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_boot_set
incr_test_counts

# --> Test: debug_test_reset : Build: uvmt_cv32e40p : Debug reset test
# --> Test (Index: 0): make test TEST=debug_test_reset : Debug reset test
echo "run_debug: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=debug_test_reset CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=debug_test_reset CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/debug_test_reset/0/xrun-debug_test_reset.log


failed=0
check_log ${log} "SIMULATION PASSED" debug_test_reset
incr_test_counts


echo "run_debug: Passing tests: ${pass_count}"
echo "run_debug: Failing tests: ${fail_count}"

if [ ${fail_count} -ne 0 ]; then
    exit 1
fi
exit 0