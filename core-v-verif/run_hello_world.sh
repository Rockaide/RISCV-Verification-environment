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
        echo "run_hello_world: Test PASSED: ${test_name} Log: ${log}"
    else
        echo "run_hello_world: Test FAILED: ${test_name} Log: ${log}"
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
echo "run_hello_world: Running build: [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make comp_corev-dv CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make comp_corev-dv CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike
popd > /dev/null

# Build:uvmt_cv32e40p 
echo "run_hello_world: Running build: [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make comp CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make comp CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike
popd > /dev/null

# --------------------------------------------------------------------------------------
# Tests
# --------------------------------------------------------------------------------------

# --> Test: hello-world : Build: uvmt_cv32e40p : UVM Hello World Test
# --> Test (Index: 0): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/0/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 1): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=1 RUN_INDEX=1  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/1/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 2): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=2 RUN_INDEX=2  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/2/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 3): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=3 RUN_INDEX=3  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/3/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 4): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=4 RUN_INDEX=4  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/4/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 5): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=5 RUN_INDEX=5  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/5/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 6): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=6 RUN_INDEX=6  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/6/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 7): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=7 RUN_INDEX=7  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/7/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 8): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=8 RUN_INDEX=8  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/8/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 9): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=9 RUN_INDEX=9  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/9/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 10): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=10 RUN_INDEX=10  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/10/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 11): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=11 RUN_INDEX=11  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/11/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 12): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=12 RUN_INDEX=12  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/12/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 13): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=13 RUN_INDEX=13  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/13/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 14): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=14 RUN_INDEX=14  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/14/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 15): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=15 RUN_INDEX=15  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/15/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 16): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=16 RUN_INDEX=16  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/16/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 17): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=17 RUN_INDEX=17  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/17/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 18): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=18 RUN_INDEX=18  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/18/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 19): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=19 RUN_INDEX=19  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/19/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 20): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=20 RUN_INDEX=20  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/20/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 21): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=21 RUN_INDEX=21  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/21/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 22): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=22 RUN_INDEX=22  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/22/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 23): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=23 RUN_INDEX=23  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/23/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 24): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=24 RUN_INDEX=24  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/24/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 25): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=25 RUN_INDEX=25  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/25/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 26): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=26 RUN_INDEX=26  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/26/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 27): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=27 RUN_INDEX=27  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/27/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 28): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=28 RUN_INDEX=28  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/28/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 29): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=29 RUN_INDEX=29  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/29/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 30): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=30 RUN_INDEX=30  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/30/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 31): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=31 RUN_INDEX=31  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/31/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 32): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=32 RUN_INDEX=32  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/32/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 33): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=33 RUN_INDEX=33  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/33/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 34): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=34 RUN_INDEX=34  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/34/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 35): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=35 RUN_INDEX=35  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/35/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 36): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=36 RUN_INDEX=36  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/36/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 37): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=37 RUN_INDEX=37  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/37/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 38): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=38 RUN_INDEX=38  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/38/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 39): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=39 RUN_INDEX=39  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/39/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 40): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=40 RUN_INDEX=40  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/40/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 41): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=41 RUN_INDEX=41  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/41/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 42): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=42 RUN_INDEX=42  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/42/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 43): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=43 RUN_INDEX=43  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/43/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 44): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=44 RUN_INDEX=44  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/44/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 45): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=45 RUN_INDEX=45  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/45/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 46): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=46 RUN_INDEX=46  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/46/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 47): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=47 RUN_INDEX=47  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/47/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 48): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=48 RUN_INDEX=48  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/48/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 49): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=49 RUN_INDEX=49  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/49/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 50): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=50 RUN_INDEX=50  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=50 RUN_INDEX=50  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/50/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 51): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=51 RUN_INDEX=51  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=51 RUN_INDEX=51  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/51/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 52): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=52 RUN_INDEX=52  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=52 RUN_INDEX=52  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/52/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 53): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=53 RUN_INDEX=53  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=53 RUN_INDEX=53  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/53/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 54): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=54 RUN_INDEX=54  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=54 RUN_INDEX=54  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/54/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 55): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=55 RUN_INDEX=55  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=55 RUN_INDEX=55  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/55/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 56): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=56 RUN_INDEX=56  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=56 RUN_INDEX=56  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/56/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 57): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=57 RUN_INDEX=57  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=57 RUN_INDEX=57  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/57/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 58): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=58 RUN_INDEX=58  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=58 RUN_INDEX=58  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/58/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 59): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=59 RUN_INDEX=59  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=59 RUN_INDEX=59  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/59/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 60): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=60 RUN_INDEX=60  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=60 RUN_INDEX=60  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/60/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 61): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=61 RUN_INDEX=61  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=61 RUN_INDEX=61  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/61/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 62): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=62 RUN_INDEX=62  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=62 RUN_INDEX=62  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/62/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 63): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=63 RUN_INDEX=63  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=63 RUN_INDEX=63  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/63/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 64): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=64 RUN_INDEX=64  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=64 RUN_INDEX=64  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/64/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 65): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=65 RUN_INDEX=65  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=65 RUN_INDEX=65  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/65/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 66): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=66 RUN_INDEX=66  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=66 RUN_INDEX=66  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/66/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 67): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=67 RUN_INDEX=67  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=67 RUN_INDEX=67  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/67/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 68): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=68 RUN_INDEX=68  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=68 RUN_INDEX=68  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/68/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 69): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=69 RUN_INDEX=69  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=69 RUN_INDEX=69  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/69/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 70): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=70 RUN_INDEX=70  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=70 RUN_INDEX=70  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/70/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 71): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=71 RUN_INDEX=71  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=71 RUN_INDEX=71  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/71/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 72): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=72 RUN_INDEX=72  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=72 RUN_INDEX=72  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/72/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 73): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=73 RUN_INDEX=73  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=73 RUN_INDEX=73  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/73/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 74): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=74 RUN_INDEX=74  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=74 RUN_INDEX=74  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/74/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 75): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=75 RUN_INDEX=75  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=75 RUN_INDEX=75  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/75/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 76): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=76 RUN_INDEX=76  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=76 RUN_INDEX=76  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/76/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 77): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=77 RUN_INDEX=77  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=77 RUN_INDEX=77  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/77/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 78): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=78 RUN_INDEX=78  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=78 RUN_INDEX=78  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/78/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 79): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=79 RUN_INDEX=79  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=79 RUN_INDEX=79  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/79/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 80): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=80 RUN_INDEX=80  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=80 RUN_INDEX=80  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/80/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 81): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=81 RUN_INDEX=81  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=81 RUN_INDEX=81  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/81/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 82): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=82 RUN_INDEX=82  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=82 RUN_INDEX=82  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/82/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 83): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=83 RUN_INDEX=83  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=83 RUN_INDEX=83  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/83/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 84): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=84 RUN_INDEX=84  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=84 RUN_INDEX=84  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/84/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 85): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=85 RUN_INDEX=85  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=85 RUN_INDEX=85  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/85/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 86): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=86 RUN_INDEX=86  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=86 RUN_INDEX=86  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/86/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 87): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=87 RUN_INDEX=87  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=87 RUN_INDEX=87  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/87/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 88): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=88 RUN_INDEX=88  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=88 RUN_INDEX=88  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/88/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 89): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=89 RUN_INDEX=89  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=89 RUN_INDEX=89  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/89/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 90): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=90 RUN_INDEX=90  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=90 RUN_INDEX=90  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/90/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 91): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=91 RUN_INDEX=91  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=91 RUN_INDEX=91  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/91/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 92): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=92 RUN_INDEX=92  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=92 RUN_INDEX=92  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/92/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 93): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=93 RUN_INDEX=93  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=93 RUN_INDEX=93  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/93/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 94): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=94 RUN_INDEX=94  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=94 RUN_INDEX=94  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/94/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 95): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=95 RUN_INDEX=95  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=95 RUN_INDEX=95  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/95/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 96): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=96 RUN_INDEX=96  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=96 RUN_INDEX=96  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/96/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 97): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=97 RUN_INDEX=97  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=97 RUN_INDEX=97  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/97/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 98): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=98 RUN_INDEX=98  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=98 RUN_INDEX=98  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/98/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 99): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=99 RUN_INDEX=99  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=99 RUN_INDEX=99  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/99/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 100): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=100 RUN_INDEX=100  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=100 RUN_INDEX=100  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/100/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 101): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=101 RUN_INDEX=101  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=101 RUN_INDEX=101  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/101/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 102): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=102 RUN_INDEX=102  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=102 RUN_INDEX=102  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/102/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 103): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=103 RUN_INDEX=103  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=103 RUN_INDEX=103  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/103/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 104): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=104 RUN_INDEX=104  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=104 RUN_INDEX=104  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/104/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 105): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=105 RUN_INDEX=105  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=105 RUN_INDEX=105  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/105/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 106): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=106 RUN_INDEX=106  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=106 RUN_INDEX=106  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/106/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 107): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=107 RUN_INDEX=107  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=107 RUN_INDEX=107  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/107/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 108): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=108 RUN_INDEX=108  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=108 RUN_INDEX=108  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/108/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 109): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=109 RUN_INDEX=109  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=109 RUN_INDEX=109  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/109/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 110): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=110 RUN_INDEX=110  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=110 RUN_INDEX=110  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/110/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 111): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=111 RUN_INDEX=111  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=111 RUN_INDEX=111  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/111/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 112): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=112 RUN_INDEX=112  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=112 RUN_INDEX=112  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/112/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 113): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=113 RUN_INDEX=113  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=113 RUN_INDEX=113  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/113/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 114): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=114 RUN_INDEX=114  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=114 RUN_INDEX=114  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/114/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 115): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=115 RUN_INDEX=115  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=115 RUN_INDEX=115  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/115/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 116): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=116 RUN_INDEX=116  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=116 RUN_INDEX=116  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/116/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 117): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=117 RUN_INDEX=117  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=117 RUN_INDEX=117  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/117/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 118): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=118 RUN_INDEX=118  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=118 RUN_INDEX=118  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/118/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 119): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=119 RUN_INDEX=119  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=119 RUN_INDEX=119  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/119/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 120): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=120 RUN_INDEX=120  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=120 RUN_INDEX=120  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/120/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 121): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=121 RUN_INDEX=121  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=121 RUN_INDEX=121  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/121/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 122): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=122 RUN_INDEX=122  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=122 RUN_INDEX=122  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/122/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 123): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=123 RUN_INDEX=123  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=123 RUN_INDEX=123  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/123/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 124): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=124 RUN_INDEX=124  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=124 RUN_INDEX=124  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/124/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 125): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=125 RUN_INDEX=125  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=125 RUN_INDEX=125  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/125/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 126): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=126 RUN_INDEX=126  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=126 RUN_INDEX=126  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/126/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 127): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=127 RUN_INDEX=127  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=127 RUN_INDEX=127  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/127/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 128): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=128 RUN_INDEX=128  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=128 RUN_INDEX=128  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/128/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 129): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=129 RUN_INDEX=129  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=129 RUN_INDEX=129  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/129/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 130): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=130 RUN_INDEX=130  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=130 RUN_INDEX=130  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/130/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 131): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=131 RUN_INDEX=131  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=131 RUN_INDEX=131  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/131/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 132): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=132 RUN_INDEX=132  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=132 RUN_INDEX=132  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/132/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 133): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=133 RUN_INDEX=133  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=133 RUN_INDEX=133  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/133/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 134): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=134 RUN_INDEX=134  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=134 RUN_INDEX=134  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/134/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 135): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=135 RUN_INDEX=135  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=135 RUN_INDEX=135  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/135/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 136): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=136 RUN_INDEX=136  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=136 RUN_INDEX=136  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/136/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 137): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=137 RUN_INDEX=137  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=137 RUN_INDEX=137  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/137/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 138): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=138 RUN_INDEX=138  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=138 RUN_INDEX=138  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/138/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 139): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=139 RUN_INDEX=139  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=139 RUN_INDEX=139  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/139/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 140): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=140 RUN_INDEX=140  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=140 RUN_INDEX=140  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/140/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 141): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=141 RUN_INDEX=141  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=141 RUN_INDEX=141  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/141/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 142): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=142 RUN_INDEX=142  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=142 RUN_INDEX=142  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/142/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 143): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=143 RUN_INDEX=143  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=143 RUN_INDEX=143  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/143/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 144): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=144 RUN_INDEX=144  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=144 RUN_INDEX=144  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/144/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 145): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=145 RUN_INDEX=145  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=145 RUN_INDEX=145  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/145/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 146): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=146 RUN_INDEX=146  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=146 RUN_INDEX=146  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/146/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 147): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=147 RUN_INDEX=147  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=147 RUN_INDEX=147  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/147/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 148): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=148 RUN_INDEX=148  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=148 RUN_INDEX=148  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/148/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 149): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=149 RUN_INDEX=149  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=149 RUN_INDEX=149  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/149/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 150): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=150 RUN_INDEX=150  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=150 RUN_INDEX=150  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/150/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 151): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=151 RUN_INDEX=151  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=151 RUN_INDEX=151  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/151/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 152): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=152 RUN_INDEX=152  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=152 RUN_INDEX=152  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/152/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 153): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=153 RUN_INDEX=153  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=153 RUN_INDEX=153  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/153/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 154): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=154 RUN_INDEX=154  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=154 RUN_INDEX=154  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/154/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 155): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=155 RUN_INDEX=155  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=155 RUN_INDEX=155  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/155/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 156): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=156 RUN_INDEX=156  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=156 RUN_INDEX=156  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/156/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 157): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=157 RUN_INDEX=157  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=157 RUN_INDEX=157  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/157/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 158): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=158 RUN_INDEX=158  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=158 RUN_INDEX=158  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/158/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 159): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=159 RUN_INDEX=159  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=159 RUN_INDEX=159  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/159/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 160): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=160 RUN_INDEX=160  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=160 RUN_INDEX=160  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/160/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 161): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=161 RUN_INDEX=161  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=161 RUN_INDEX=161  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/161/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 162): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=162 RUN_INDEX=162  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=162 RUN_INDEX=162  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/162/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 163): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=163 RUN_INDEX=163  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=163 RUN_INDEX=163  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/163/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 164): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=164 RUN_INDEX=164  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=164 RUN_INDEX=164  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/164/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 165): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=165 RUN_INDEX=165  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=165 RUN_INDEX=165  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/165/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 166): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=166 RUN_INDEX=166  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=166 RUN_INDEX=166  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/166/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 167): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=167 RUN_INDEX=167  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=167 RUN_INDEX=167  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/167/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 168): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=168 RUN_INDEX=168  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=168 RUN_INDEX=168  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/168/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 169): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=169 RUN_INDEX=169  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=169 RUN_INDEX=169  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/169/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 170): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=170 RUN_INDEX=170  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=170 RUN_INDEX=170  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/170/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 171): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=171 RUN_INDEX=171  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=171 RUN_INDEX=171  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/171/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 172): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=172 RUN_INDEX=172  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=172 RUN_INDEX=172  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/172/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 173): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=173 RUN_INDEX=173  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=173 RUN_INDEX=173  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/173/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 174): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=174 RUN_INDEX=174  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=174 RUN_INDEX=174  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/174/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 175): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=175 RUN_INDEX=175  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=175 RUN_INDEX=175  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/175/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 176): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=176 RUN_INDEX=176  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=176 RUN_INDEX=176  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/176/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 177): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=177 RUN_INDEX=177  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=177 RUN_INDEX=177  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/177/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 178): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=178 RUN_INDEX=178  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=178 RUN_INDEX=178  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/178/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 179): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=179 RUN_INDEX=179  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=179 RUN_INDEX=179  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/179/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 180): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=180 RUN_INDEX=180  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=180 RUN_INDEX=180  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/180/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 181): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=181 RUN_INDEX=181  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=181 RUN_INDEX=181  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/181/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 182): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=182 RUN_INDEX=182  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=182 RUN_INDEX=182  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/182/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 183): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=183 RUN_INDEX=183  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=183 RUN_INDEX=183  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/183/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 184): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=184 RUN_INDEX=184  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=184 RUN_INDEX=184  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/184/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 185): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=185 RUN_INDEX=185  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=185 RUN_INDEX=185  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/185/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 186): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=186 RUN_INDEX=186  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=186 RUN_INDEX=186  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/186/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 187): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=187 RUN_INDEX=187  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=187 RUN_INDEX=187  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/187/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 188): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=188 RUN_INDEX=188  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=188 RUN_INDEX=188  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/188/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 189): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=189 RUN_INDEX=189  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=189 RUN_INDEX=189  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/189/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 190): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=190 RUN_INDEX=190  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=190 RUN_INDEX=190  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/190/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 191): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=191 RUN_INDEX=191  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=191 RUN_INDEX=191  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/191/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 192): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=192 RUN_INDEX=192  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=192 RUN_INDEX=192  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/192/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 193): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=193 RUN_INDEX=193  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=193 RUN_INDEX=193  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/193/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 194): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=194 RUN_INDEX=194  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=194 RUN_INDEX=194  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/194/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 195): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=195 RUN_INDEX=195  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=195 RUN_INDEX=195  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/195/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 196): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=196 RUN_INDEX=196  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=196 RUN_INDEX=196  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/196/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 197): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=197 RUN_INDEX=197  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=197 RUN_INDEX=197  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/197/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 198): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=198 RUN_INDEX=198  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=198 RUN_INDEX=198  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/198/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 199): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=199 RUN_INDEX=199  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=199 RUN_INDEX=199  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/199/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 200): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=200 RUN_INDEX=200  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=200 RUN_INDEX=200  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/200/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 201): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=201 RUN_INDEX=201  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=201 RUN_INDEX=201  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/201/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 202): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=202 RUN_INDEX=202  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=202 RUN_INDEX=202  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/202/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 203): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=203 RUN_INDEX=203  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=203 RUN_INDEX=203  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/203/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 204): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=204 RUN_INDEX=204  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=204 RUN_INDEX=204  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/204/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 205): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=205 RUN_INDEX=205  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=205 RUN_INDEX=205  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/205/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 206): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=206 RUN_INDEX=206  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=206 RUN_INDEX=206  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/206/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 207): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=207 RUN_INDEX=207  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=207 RUN_INDEX=207  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/207/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 208): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=208 RUN_INDEX=208  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=208 RUN_INDEX=208  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/208/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 209): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=209 RUN_INDEX=209  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=209 RUN_INDEX=209  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/209/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 210): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=210 RUN_INDEX=210  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=210 RUN_INDEX=210  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/210/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 211): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=211 RUN_INDEX=211  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=211 RUN_INDEX=211  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/211/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 212): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=212 RUN_INDEX=212  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=212 RUN_INDEX=212  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/212/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 213): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=213 RUN_INDEX=213  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=213 RUN_INDEX=213  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/213/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 214): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=214 RUN_INDEX=214  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=214 RUN_INDEX=214  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/214/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 215): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=215 RUN_INDEX=215  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=215 RUN_INDEX=215  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/215/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 216): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=216 RUN_INDEX=216  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=216 RUN_INDEX=216  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/216/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 217): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=217 RUN_INDEX=217  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=217 RUN_INDEX=217  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/217/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 218): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=218 RUN_INDEX=218  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=218 RUN_INDEX=218  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/218/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 219): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=219 RUN_INDEX=219  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=219 RUN_INDEX=219  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/219/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 220): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=220 RUN_INDEX=220  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=220 RUN_INDEX=220  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/220/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 221): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=221 RUN_INDEX=221  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=221 RUN_INDEX=221  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/221/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 222): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=222 RUN_INDEX=222  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=222 RUN_INDEX=222  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/222/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 223): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=223 RUN_INDEX=223  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=223 RUN_INDEX=223  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/223/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 224): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=224 RUN_INDEX=224  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=224 RUN_INDEX=224  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/224/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 225): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=225 RUN_INDEX=225  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=225 RUN_INDEX=225  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/225/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 226): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=226 RUN_INDEX=226  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=226 RUN_INDEX=226  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/226/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 227): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=227 RUN_INDEX=227  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=227 RUN_INDEX=227  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/227/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 228): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=228 RUN_INDEX=228  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=228 RUN_INDEX=228  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/228/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 229): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=229 RUN_INDEX=229  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=229 RUN_INDEX=229  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/229/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 230): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=230 RUN_INDEX=230  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=230 RUN_INDEX=230  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/230/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 231): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=231 RUN_INDEX=231  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=231 RUN_INDEX=231  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/231/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 232): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=232 RUN_INDEX=232  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=232 RUN_INDEX=232  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/232/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 233): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=233 RUN_INDEX=233  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=233 RUN_INDEX=233  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/233/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 234): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=234 RUN_INDEX=234  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=234 RUN_INDEX=234  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/234/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 235): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=235 RUN_INDEX=235  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=235 RUN_INDEX=235  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/235/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 236): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=236 RUN_INDEX=236  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=236 RUN_INDEX=236  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/236/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 237): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=237 RUN_INDEX=237  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=237 RUN_INDEX=237  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/237/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 238): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=238 RUN_INDEX=238  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=238 RUN_INDEX=238  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/238/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 239): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=239 RUN_INDEX=239  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=239 RUN_INDEX=239  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/239/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 240): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=240 RUN_INDEX=240  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=240 RUN_INDEX=240  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/240/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 241): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=241 RUN_INDEX=241  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=241 RUN_INDEX=241  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/241/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 242): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=242 RUN_INDEX=242  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=242 RUN_INDEX=242  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/242/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 243): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=243 RUN_INDEX=243  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=243 RUN_INDEX=243  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/243/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 244): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=244 RUN_INDEX=244  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=244 RUN_INDEX=244  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/244/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 245): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=245 RUN_INDEX=245  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=245 RUN_INDEX=245  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/245/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 246): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=246 RUN_INDEX=246  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=246 RUN_INDEX=246  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/246/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 247): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=247 RUN_INDEX=247  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=247 RUN_INDEX=247  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/247/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 248): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=248 RUN_INDEX=248  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=248 RUN_INDEX=248  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/248/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 249): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=249 RUN_INDEX=249  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=249 RUN_INDEX=249  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/249/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 250): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=250 RUN_INDEX=250  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=250 RUN_INDEX=250  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/250/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 251): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=251 RUN_INDEX=251  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=251 RUN_INDEX=251  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/251/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 252): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=252 RUN_INDEX=252  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=252 RUN_INDEX=252  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/252/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 253): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=253 RUN_INDEX=253  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=253 RUN_INDEX=253  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/253/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 254): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=254 RUN_INDEX=254  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=254 RUN_INDEX=254  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/254/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 255): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=255 RUN_INDEX=255  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=255 RUN_INDEX=255  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/255/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 256): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=256 RUN_INDEX=256  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=256 RUN_INDEX=256  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/256/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 257): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=257 RUN_INDEX=257  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=257 RUN_INDEX=257  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/257/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 258): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=258 RUN_INDEX=258  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=258 RUN_INDEX=258  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/258/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 259): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=259 RUN_INDEX=259  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=259 RUN_INDEX=259  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/259/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 260): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=260 RUN_INDEX=260  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=260 RUN_INDEX=260  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/260/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 261): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=261 RUN_INDEX=261  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=261 RUN_INDEX=261  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/261/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 262): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=262 RUN_INDEX=262  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=262 RUN_INDEX=262  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/262/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 263): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=263 RUN_INDEX=263  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=263 RUN_INDEX=263  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/263/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 264): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=264 RUN_INDEX=264  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=264 RUN_INDEX=264  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/264/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 265): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=265 RUN_INDEX=265  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=265 RUN_INDEX=265  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/265/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 266): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=266 RUN_INDEX=266  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=266 RUN_INDEX=266  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/266/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 267): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=267 RUN_INDEX=267  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=267 RUN_INDEX=267  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/267/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 268): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=268 RUN_INDEX=268  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=268 RUN_INDEX=268  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/268/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 269): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=269 RUN_INDEX=269  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=269 RUN_INDEX=269  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/269/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 270): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=270 RUN_INDEX=270  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=270 RUN_INDEX=270  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/270/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 271): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=271 RUN_INDEX=271  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=271 RUN_INDEX=271  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/271/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 272): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=272 RUN_INDEX=272  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=272 RUN_INDEX=272  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/272/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 273): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=273 RUN_INDEX=273  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=273 RUN_INDEX=273  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/273/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 274): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=274 RUN_INDEX=274  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=274 RUN_INDEX=274  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/274/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 275): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=275 RUN_INDEX=275  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=275 RUN_INDEX=275  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/275/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 276): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=276 RUN_INDEX=276  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=276 RUN_INDEX=276  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/276/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 277): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=277 RUN_INDEX=277  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=277 RUN_INDEX=277  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/277/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 278): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=278 RUN_INDEX=278  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=278 RUN_INDEX=278  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/278/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 279): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=279 RUN_INDEX=279  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=279 RUN_INDEX=279  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/279/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 280): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=280 RUN_INDEX=280  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=280 RUN_INDEX=280  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/280/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 281): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=281 RUN_INDEX=281  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=281 RUN_INDEX=281  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/281/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 282): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=282 RUN_INDEX=282  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=282 RUN_INDEX=282  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/282/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 283): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=283 RUN_INDEX=283  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=283 RUN_INDEX=283  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/283/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 284): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=284 RUN_INDEX=284  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=284 RUN_INDEX=284  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/284/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 285): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=285 RUN_INDEX=285  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=285 RUN_INDEX=285  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/285/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 286): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=286 RUN_INDEX=286  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=286 RUN_INDEX=286  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/286/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 287): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=287 RUN_INDEX=287  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=287 RUN_INDEX=287  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/287/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 288): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=288 RUN_INDEX=288  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=288 RUN_INDEX=288  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/288/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 289): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=289 RUN_INDEX=289  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=289 RUN_INDEX=289  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/289/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 290): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=290 RUN_INDEX=290  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=290 RUN_INDEX=290  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/290/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 291): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=291 RUN_INDEX=291  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=291 RUN_INDEX=291  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/291/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 292): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=292 RUN_INDEX=292  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=292 RUN_INDEX=292  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/292/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 293): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=293 RUN_INDEX=293  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=293 RUN_INDEX=293  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/293/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 294): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=294 RUN_INDEX=294  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=294 RUN_INDEX=294  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/294/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 295): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=295 RUN_INDEX=295  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=295 RUN_INDEX=295  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/295/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 296): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=296 RUN_INDEX=296  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=296 RUN_INDEX=296  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/296/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 297): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=297 RUN_INDEX=297  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=297 RUN_INDEX=297  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/297/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 298): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=298 RUN_INDEX=298  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=298 RUN_INDEX=298  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/298/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 299): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=299 RUN_INDEX=299  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=299 RUN_INDEX=299  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/299/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 300): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=300 RUN_INDEX=300  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=300 RUN_INDEX=300  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/300/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 301): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=301 RUN_INDEX=301  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=301 RUN_INDEX=301  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/301/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 302): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=302 RUN_INDEX=302  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=302 RUN_INDEX=302  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/302/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 303): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=303 RUN_INDEX=303  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=303 RUN_INDEX=303  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/303/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 304): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=304 RUN_INDEX=304  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=304 RUN_INDEX=304  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/304/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 305): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=305 RUN_INDEX=305  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=305 RUN_INDEX=305  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/305/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 306): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=306 RUN_INDEX=306  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=306 RUN_INDEX=306  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/306/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 307): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=307 RUN_INDEX=307  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=307 RUN_INDEX=307  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/307/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 308): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=308 RUN_INDEX=308  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=308 RUN_INDEX=308  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/308/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 309): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=309 RUN_INDEX=309  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=309 RUN_INDEX=309  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/309/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 310): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=310 RUN_INDEX=310  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=310 RUN_INDEX=310  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/310/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 311): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=311 RUN_INDEX=311  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=311 RUN_INDEX=311  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/311/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 312): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=312 RUN_INDEX=312  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=312 RUN_INDEX=312  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/312/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 313): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=313 RUN_INDEX=313  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=313 RUN_INDEX=313  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/313/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 314): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=314 RUN_INDEX=314  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=314 RUN_INDEX=314  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/314/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 315): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=315 RUN_INDEX=315  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=315 RUN_INDEX=315  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/315/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 316): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=316 RUN_INDEX=316  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=316 RUN_INDEX=316  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/316/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 317): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=317 RUN_INDEX=317  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=317 RUN_INDEX=317  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/317/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 318): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=318 RUN_INDEX=318  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=318 RUN_INDEX=318  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/318/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 319): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=319 RUN_INDEX=319  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=319 RUN_INDEX=319  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/319/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 320): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=320 RUN_INDEX=320  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=320 RUN_INDEX=320  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/320/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 321): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=321 RUN_INDEX=321  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=321 RUN_INDEX=321  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/321/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 322): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=322 RUN_INDEX=322  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=322 RUN_INDEX=322  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/322/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 323): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=323 RUN_INDEX=323  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=323 RUN_INDEX=323  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/323/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 324): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=324 RUN_INDEX=324  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=324 RUN_INDEX=324  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/324/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 325): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=325 RUN_INDEX=325  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=325 RUN_INDEX=325  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/325/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 326): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=326 RUN_INDEX=326  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=326 RUN_INDEX=326  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/326/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 327): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=327 RUN_INDEX=327  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=327 RUN_INDEX=327  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/327/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 328): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=328 RUN_INDEX=328  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=328 RUN_INDEX=328  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/328/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 329): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=329 RUN_INDEX=329  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=329 RUN_INDEX=329  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/329/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 330): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=330 RUN_INDEX=330  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=330 RUN_INDEX=330  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/330/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 331): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=331 RUN_INDEX=331  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=331 RUN_INDEX=331  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/331/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 332): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=332 RUN_INDEX=332  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=332 RUN_INDEX=332  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/332/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 333): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=333 RUN_INDEX=333  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=333 RUN_INDEX=333  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/333/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 334): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=334 RUN_INDEX=334  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=334 RUN_INDEX=334  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/334/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 335): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=335 RUN_INDEX=335  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=335 RUN_INDEX=335  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/335/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 336): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=336 RUN_INDEX=336  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=336 RUN_INDEX=336  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/336/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 337): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=337 RUN_INDEX=337  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=337 RUN_INDEX=337  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/337/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 338): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=338 RUN_INDEX=338  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=338 RUN_INDEX=338  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/338/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 339): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=339 RUN_INDEX=339  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=339 RUN_INDEX=339  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/339/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 340): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=340 RUN_INDEX=340  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=340 RUN_INDEX=340  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/340/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 341): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=341 RUN_INDEX=341  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=341 RUN_INDEX=341  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/341/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 342): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=342 RUN_INDEX=342  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=342 RUN_INDEX=342  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/342/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 343): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=343 RUN_INDEX=343  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=343 RUN_INDEX=343  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/343/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 344): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=344 RUN_INDEX=344  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=344 RUN_INDEX=344  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/344/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 345): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=345 RUN_INDEX=345  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=345 RUN_INDEX=345  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/345/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 346): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=346 RUN_INDEX=346  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=346 RUN_INDEX=346  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/346/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 347): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=347 RUN_INDEX=347  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=347 RUN_INDEX=347  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/347/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 348): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=348 RUN_INDEX=348  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=348 RUN_INDEX=348  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/348/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 349): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=349 RUN_INDEX=349  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=349 RUN_INDEX=349  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/349/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 350): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=350 RUN_INDEX=350  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=350 RUN_INDEX=350  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/350/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 351): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=351 RUN_INDEX=351  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=351 RUN_INDEX=351  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/351/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 352): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=352 RUN_INDEX=352  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=352 RUN_INDEX=352  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/352/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 353): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=353 RUN_INDEX=353  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=353 RUN_INDEX=353  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/353/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 354): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=354 RUN_INDEX=354  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=354 RUN_INDEX=354  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/354/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 355): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=355 RUN_INDEX=355  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=355 RUN_INDEX=355  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/355/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 356): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=356 RUN_INDEX=356  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=356 RUN_INDEX=356  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/356/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 357): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=357 RUN_INDEX=357  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=357 RUN_INDEX=357  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/357/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 358): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=358 RUN_INDEX=358  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=358 RUN_INDEX=358  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/358/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 359): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=359 RUN_INDEX=359  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=359 RUN_INDEX=359  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/359/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 360): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=360 RUN_INDEX=360  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=360 RUN_INDEX=360  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/360/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 361): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=361 RUN_INDEX=361  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=361 RUN_INDEX=361  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/361/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 362): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=362 RUN_INDEX=362  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=362 RUN_INDEX=362  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/362/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 363): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=363 RUN_INDEX=363  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=363 RUN_INDEX=363  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/363/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 364): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=364 RUN_INDEX=364  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=364 RUN_INDEX=364  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/364/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 365): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=365 RUN_INDEX=365  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=365 RUN_INDEX=365  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/365/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 366): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=366 RUN_INDEX=366  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=366 RUN_INDEX=366  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/366/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 367): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=367 RUN_INDEX=367  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=367 RUN_INDEX=367  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/367/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 368): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=368 RUN_INDEX=368  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=368 RUN_INDEX=368  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/368/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 369): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=369 RUN_INDEX=369  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=369 RUN_INDEX=369  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/369/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 370): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=370 RUN_INDEX=370  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=370 RUN_INDEX=370  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/370/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 371): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=371 RUN_INDEX=371  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=371 RUN_INDEX=371  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/371/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 372): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=372 RUN_INDEX=372  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=372 RUN_INDEX=372  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/372/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 373): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=373 RUN_INDEX=373  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=373 RUN_INDEX=373  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/373/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 374): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=374 RUN_INDEX=374  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=374 RUN_INDEX=374  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/374/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 375): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=375 RUN_INDEX=375  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=375 RUN_INDEX=375  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/375/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 376): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=376 RUN_INDEX=376  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=376 RUN_INDEX=376  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/376/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 377): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=377 RUN_INDEX=377  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=377 RUN_INDEX=377  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/377/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 378): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=378 RUN_INDEX=378  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=378 RUN_INDEX=378  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/378/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 379): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=379 RUN_INDEX=379  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=379 RUN_INDEX=379  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/379/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 380): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=380 RUN_INDEX=380  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=380 RUN_INDEX=380  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/380/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 381): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=381 RUN_INDEX=381  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=381 RUN_INDEX=381  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/381/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 382): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=382 RUN_INDEX=382  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=382 RUN_INDEX=382  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/382/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 383): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=383 RUN_INDEX=383  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=383 RUN_INDEX=383  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/383/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 384): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=384 RUN_INDEX=384  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=384 RUN_INDEX=384  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/384/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 385): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=385 RUN_INDEX=385  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=385 RUN_INDEX=385  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/385/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 386): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=386 RUN_INDEX=386  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=386 RUN_INDEX=386  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/386/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 387): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=387 RUN_INDEX=387  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=387 RUN_INDEX=387  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/387/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 388): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=388 RUN_INDEX=388  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=388 RUN_INDEX=388  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/388/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 389): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=389 RUN_INDEX=389  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=389 RUN_INDEX=389  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/389/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 390): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=390 RUN_INDEX=390  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=390 RUN_INDEX=390  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/390/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 391): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=391 RUN_INDEX=391  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=391 RUN_INDEX=391  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/391/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 392): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=392 RUN_INDEX=392  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=392 RUN_INDEX=392  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/392/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 393): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=393 RUN_INDEX=393  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=393 RUN_INDEX=393  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/393/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 394): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=394 RUN_INDEX=394  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=394 RUN_INDEX=394  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/394/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 395): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=395 RUN_INDEX=395  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=395 RUN_INDEX=395  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/395/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 396): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=396 RUN_INDEX=396  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=396 RUN_INDEX=396  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/396/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 397): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=397 RUN_INDEX=397  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=397 RUN_INDEX=397  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/397/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 398): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=398 RUN_INDEX=398  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=398 RUN_INDEX=398  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/398/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 399): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=399 RUN_INDEX=399  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=399 RUN_INDEX=399  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/399/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 400): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=400 RUN_INDEX=400  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=400 RUN_INDEX=400  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/400/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 401): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=401 RUN_INDEX=401  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=401 RUN_INDEX=401  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/401/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 402): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=402 RUN_INDEX=402  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=402 RUN_INDEX=402  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/402/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 403): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=403 RUN_INDEX=403  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=403 RUN_INDEX=403  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/403/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 404): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=404 RUN_INDEX=404  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=404 RUN_INDEX=404  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/404/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 405): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=405 RUN_INDEX=405  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=405 RUN_INDEX=405  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/405/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 406): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=406 RUN_INDEX=406  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=406 RUN_INDEX=406  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/406/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 407): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=407 RUN_INDEX=407  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=407 RUN_INDEX=407  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/407/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 408): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=408 RUN_INDEX=408  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=408 RUN_INDEX=408  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/408/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 409): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=409 RUN_INDEX=409  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=409 RUN_INDEX=409  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/409/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 410): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=410 RUN_INDEX=410  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=410 RUN_INDEX=410  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/410/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 411): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=411 RUN_INDEX=411  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=411 RUN_INDEX=411  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/411/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 412): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=412 RUN_INDEX=412  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=412 RUN_INDEX=412  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/412/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 413): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=413 RUN_INDEX=413  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=413 RUN_INDEX=413  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/413/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 414): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=414 RUN_INDEX=414  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=414 RUN_INDEX=414  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/414/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 415): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=415 RUN_INDEX=415  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=415 RUN_INDEX=415  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/415/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 416): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=416 RUN_INDEX=416  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=416 RUN_INDEX=416  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/416/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 417): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=417 RUN_INDEX=417  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=417 RUN_INDEX=417  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/417/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 418): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=418 RUN_INDEX=418  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=418 RUN_INDEX=418  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/418/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 419): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=419 RUN_INDEX=419  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=419 RUN_INDEX=419  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/419/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 420): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=420 RUN_INDEX=420  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=420 RUN_INDEX=420  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/420/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 421): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=421 RUN_INDEX=421  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=421 RUN_INDEX=421  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/421/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 422): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=422 RUN_INDEX=422  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=422 RUN_INDEX=422  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/422/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 423): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=423 RUN_INDEX=423  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=423 RUN_INDEX=423  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/423/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 424): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=424 RUN_INDEX=424  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=424 RUN_INDEX=424  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/424/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 425): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=425 RUN_INDEX=425  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=425 RUN_INDEX=425  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/425/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 426): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=426 RUN_INDEX=426  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=426 RUN_INDEX=426  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/426/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 427): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=427 RUN_INDEX=427  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=427 RUN_INDEX=427  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/427/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 428): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=428 RUN_INDEX=428  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=428 RUN_INDEX=428  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/428/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 429): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=429 RUN_INDEX=429  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=429 RUN_INDEX=429  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/429/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 430): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=430 RUN_INDEX=430  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=430 RUN_INDEX=430  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/430/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 431): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=431 RUN_INDEX=431  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=431 RUN_INDEX=431  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/431/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 432): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=432 RUN_INDEX=432  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=432 RUN_INDEX=432  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/432/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 433): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=433 RUN_INDEX=433  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=433 RUN_INDEX=433  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/433/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 434): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=434 RUN_INDEX=434  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=434 RUN_INDEX=434  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/434/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 435): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=435 RUN_INDEX=435  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=435 RUN_INDEX=435  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/435/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 436): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=436 RUN_INDEX=436  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=436 RUN_INDEX=436  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/436/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 437): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=437 RUN_INDEX=437  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=437 RUN_INDEX=437  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/437/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 438): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=438 RUN_INDEX=438  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=438 RUN_INDEX=438  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/438/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 439): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=439 RUN_INDEX=439  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=439 RUN_INDEX=439  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/439/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 440): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=440 RUN_INDEX=440  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=440 RUN_INDEX=440  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/440/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 441): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=441 RUN_INDEX=441  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=441 RUN_INDEX=441  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/441/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 442): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=442 RUN_INDEX=442  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=442 RUN_INDEX=442  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/442/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 443): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=443 RUN_INDEX=443  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=443 RUN_INDEX=443  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/443/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 444): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=444 RUN_INDEX=444  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=444 RUN_INDEX=444  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/444/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 445): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=445 RUN_INDEX=445  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=445 RUN_INDEX=445  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/445/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 446): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=446 RUN_INDEX=446  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=446 RUN_INDEX=446  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/446/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 447): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=447 RUN_INDEX=447  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=447 RUN_INDEX=447  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/447/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 448): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=448 RUN_INDEX=448  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=448 RUN_INDEX=448  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/448/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 449): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=449 RUN_INDEX=449  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=449 RUN_INDEX=449  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/449/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 450): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=450 RUN_INDEX=450  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=450 RUN_INDEX=450  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/450/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 451): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=451 RUN_INDEX=451  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=451 RUN_INDEX=451  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/451/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 452): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=452 RUN_INDEX=452  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=452 RUN_INDEX=452  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/452/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 453): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=453 RUN_INDEX=453  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=453 RUN_INDEX=453  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/453/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 454): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=454 RUN_INDEX=454  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=454 RUN_INDEX=454  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/454/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 455): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=455 RUN_INDEX=455  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=455 RUN_INDEX=455  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/455/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 456): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=456 RUN_INDEX=456  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=456 RUN_INDEX=456  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/456/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 457): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=457 RUN_INDEX=457  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=457 RUN_INDEX=457  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/457/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 458): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=458 RUN_INDEX=458  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=458 RUN_INDEX=458  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/458/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 459): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=459 RUN_INDEX=459  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=459 RUN_INDEX=459  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/459/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 460): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=460 RUN_INDEX=460  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=460 RUN_INDEX=460  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/460/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 461): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=461 RUN_INDEX=461  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=461 RUN_INDEX=461  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/461/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 462): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=462 RUN_INDEX=462  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=462 RUN_INDEX=462  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/462/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 463): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=463 RUN_INDEX=463  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=463 RUN_INDEX=463  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/463/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 464): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=464 RUN_INDEX=464  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=464 RUN_INDEX=464  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/464/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 465): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=465 RUN_INDEX=465  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=465 RUN_INDEX=465  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/465/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 466): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=466 RUN_INDEX=466  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=466 RUN_INDEX=466  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/466/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 467): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=467 RUN_INDEX=467  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=467 RUN_INDEX=467  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/467/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 468): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=468 RUN_INDEX=468  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=468 RUN_INDEX=468  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/468/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 469): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=469 RUN_INDEX=469  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=469 RUN_INDEX=469  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/469/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 470): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=470 RUN_INDEX=470  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=470 RUN_INDEX=470  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/470/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 471): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=471 RUN_INDEX=471  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=471 RUN_INDEX=471  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/471/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 472): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=472 RUN_INDEX=472  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=472 RUN_INDEX=472  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/472/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 473): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=473 RUN_INDEX=473  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=473 RUN_INDEX=473  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/473/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 474): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=474 RUN_INDEX=474  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=474 RUN_INDEX=474  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/474/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 475): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=475 RUN_INDEX=475  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=475 RUN_INDEX=475  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/475/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 476): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=476 RUN_INDEX=476  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=476 RUN_INDEX=476  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/476/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 477): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=477 RUN_INDEX=477  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=477 RUN_INDEX=477  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/477/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 478): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=478 RUN_INDEX=478  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=478 RUN_INDEX=478  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/478/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 479): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=479 RUN_INDEX=479  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=479 RUN_INDEX=479  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/479/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 480): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=480 RUN_INDEX=480  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=480 RUN_INDEX=480  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/480/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 481): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=481 RUN_INDEX=481  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=481 RUN_INDEX=481  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/481/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 482): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=482 RUN_INDEX=482  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=482 RUN_INDEX=482  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/482/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 483): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=483 RUN_INDEX=483  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=483 RUN_INDEX=483  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/483/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 484): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=484 RUN_INDEX=484  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=484 RUN_INDEX=484  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/484/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 485): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=485 RUN_INDEX=485  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=485 RUN_INDEX=485  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/485/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 486): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=486 RUN_INDEX=486  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=486 RUN_INDEX=486  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/486/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 487): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=487 RUN_INDEX=487  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=487 RUN_INDEX=487  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/487/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 488): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=488 RUN_INDEX=488  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=488 RUN_INDEX=488  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/488/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 489): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=489 RUN_INDEX=489  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=489 RUN_INDEX=489  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/489/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 490): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=490 RUN_INDEX=490  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=490 RUN_INDEX=490  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/490/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 491): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=491 RUN_INDEX=491  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=491 RUN_INDEX=491  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/491/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 492): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=492 RUN_INDEX=492  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=492 RUN_INDEX=492  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/492/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 493): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=493 RUN_INDEX=493  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=493 RUN_INDEX=493  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/493/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 494): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=494 RUN_INDEX=494  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=494 RUN_INDEX=494  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/494/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 495): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=495 RUN_INDEX=495  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=495 RUN_INDEX=495  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/495/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 496): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=496 RUN_INDEX=496  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=496 RUN_INDEX=496  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/496/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 497): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=497 RUN_INDEX=497  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=497 RUN_INDEX=497  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/497/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 498): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=498 RUN_INDEX=498  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=498 RUN_INDEX=498  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/498/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts
# --> Test (Index: 499): make test COREV=YES TEST=hello-world : UVM Hello World Test
echo "run_hello_world: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=499 RUN_INDEX=499  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test COREV=YES TEST=hello-world CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=YES COV= SEED=random GEN_START_INDEX=499 RUN_INDEX=499  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/hello-world/499/xrun-hello-world.log


failed=0
check_log ${log} "SIMULATION PASSED" hello-world
incr_test_counts


echo "run_hello_world: Passing tests: ${pass_count}"
echo "run_hello_world: Failing tests: ${fail_count}"

if [ ${fail_count} -ne 0 ]; then
    exit 1
fi
exit 0