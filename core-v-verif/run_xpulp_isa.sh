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
        echo "run_xpulp_isa: Test PASSED: ${test_name} Log: ${log}"
    else
        echo "run_xpulp_isa: Test FAILED: ${test_name} Log: ${log}"
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
echo "run_xpulp_isa: Running build: [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make comp_corev-dv CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make comp_corev-dv CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike
popd > /dev/null

# Build:uvmt_cv32e40p 
echo "run_xpulp_isa: Running build: [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make comp CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make comp CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  USE_ISS=YES ISS=spike
popd > /dev/null

# --------------------------------------------------------------------------------------
# Tests
# --------------------------------------------------------------------------------------

# --> Test: pulp_bit_manipulation : Build: uvmt_cv32e40p : pulp_bit_manipulation
# --> Test (Index: 0): make test TEST=pulp_bit_manipulation CFG=pulp : pulp_bit_manipulation
echo "run_xpulp_isa: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=pulp_bit_manipulation CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=pulp_bit_manipulation CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/pulp_bit_manipulation/0/xrun-pulp_bit_manipulation.log


failed=0
check_log ${log} "SIMULATION PASSED" pulp_bit_manipulation
incr_test_counts

# --> Test: pulp_general_alu : Build: uvmt_cv32e40p : pulp_general_alu
# --> Test (Index: 0): make test TEST=pulp_general_alu CFG=pulp : pulp_general_alu
echo "run_xpulp_isa: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=pulp_general_alu CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=pulp_general_alu CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/pulp_general_alu/0/xrun-pulp_general_alu.log


failed=0
check_log ${log} "SIMULATION PASSED" pulp_general_alu
incr_test_counts

# --> Test: pulp_immediate_branching : Build: uvmt_cv32e40p : pulp_immediate_branching
# --> Test (Index: 0): make test TEST=pulp_immediate_branching CFG=pulp : pulp_immediate_branching
echo "run_xpulp_isa: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=pulp_immediate_branching CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=pulp_immediate_branching CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/pulp_immediate_branching/0/xrun-pulp_immediate_branching.log


failed=0
check_log ${log} "SIMULATION PASSED" pulp_immediate_branching
incr_test_counts

# --> Test: pulp_multiply_accumulate : Build: uvmt_cv32e40p : pulp_multiply_accumulate
# --> Test (Index: 0): make test TEST=pulp_multiply_accumulate CFG=pulp : pulp_multiply_accumulate
echo "run_xpulp_isa: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=pulp_multiply_accumulate CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=pulp_multiply_accumulate CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/pulp_multiply_accumulate/0/xrun-pulp_multiply_accumulate.log


failed=0
check_log ${log} "SIMULATION PASSED" pulp_multiply_accumulate
incr_test_counts

# --> Test: pulp_post_increment_load_store : Build: uvmt_cv32e40p : pulp_post_increment_load_store
# --> Test (Index: 0): make test TEST=pulp_post_increment_load_store CFG=pulp : pulp_post_increment_load_store
echo "run_xpulp_isa: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=pulp_post_increment_load_store CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=pulp_post_increment_load_store CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/pulp_post_increment_load_store/0/xrun-pulp_post_increment_load_store.log


failed=0
check_log ${log} "SIMULATION PASSED" pulp_post_increment_load_store
incr_test_counts

# --> Test: pulp_vectorial_add_sub : Build: uvmt_cv32e40p : pulp_vectorial_add_sub
# --> Test (Index: 0): make test TEST=pulp_vectorial_add_sub CFG=pulp : pulp_vectorial_add_sub
echo "run_xpulp_isa: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=pulp_vectorial_add_sub CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=pulp_vectorial_add_sub CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/pulp_vectorial_add_sub/0/xrun-pulp_vectorial_add_sub.log


failed=0
check_log ${log} "SIMULATION PASSED" pulp_vectorial_add_sub
incr_test_counts

# --> Test: pulp_vectorial_avg : Build: uvmt_cv32e40p : pulp_vectorial_avg
# --> Test (Index: 0): make test TEST=pulp_vectorial_avg CFG=pulp : pulp_vectorial_avg
echo "run_xpulp_isa: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=pulp_vectorial_avg CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=pulp_vectorial_avg CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/pulp_vectorial_avg/0/xrun-pulp_vectorial_avg.log


failed=0
check_log ${log} "SIMULATION PASSED" pulp_vectorial_avg
incr_test_counts

# --> Test: pulp_vectorial_bit_manip : Build: uvmt_cv32e40p : pulp_vectorial_bit_manip
# --> Test (Index: 0): make test TEST=pulp_vectorial_bit_manip CFG=pulp : pulp_vectorial_bit_manip
echo "run_xpulp_isa: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=pulp_vectorial_bit_manip CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=pulp_vectorial_bit_manip CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/pulp_vectorial_bit_manip/0/xrun-pulp_vectorial_bit_manip.log


failed=0
check_log ${log} "SIMULATION PASSED" pulp_vectorial_bit_manip
incr_test_counts

# --> Test: pulp_vectorial_bitwise : Build: uvmt_cv32e40p : pulp_vectorial_bitwise
# --> Test (Index: 0): make test TEST=pulp_vectorial_bitwise CFG=pulp : pulp_vectorial_bitwise
echo "run_xpulp_isa: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=pulp_vectorial_bitwise CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=pulp_vectorial_bitwise CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/pulp_vectorial_bitwise/0/xrun-pulp_vectorial_bitwise.log


failed=0
check_log ${log} "SIMULATION PASSED" pulp_vectorial_bitwise
incr_test_counts

# --> Test: pulp_vectorial_comparison_1 : Build: uvmt_cv32e40p : pulp_vectorial_comparison_1
# --> Test (Index: 0): make test TEST=pulp_vectorial_comparison_1 CFG=pulp : pulp_vectorial_comparison_1
echo "run_xpulp_isa: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=pulp_vectorial_comparison_1 CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=pulp_vectorial_comparison_1 CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/pulp_vectorial_comparison_1/0/xrun-pulp_vectorial_comparison_1.log


failed=0
check_log ${log} "SIMULATION PASSED" pulp_vectorial_comparison_1
incr_test_counts

# --> Test: pulp_vectorial_comparison_2 : Build: uvmt_cv32e40p : pulp_vectorial_comparison_2
# --> Test (Index: 0): make test TEST=pulp_vectorial_comparison_2 CFG=pulp : pulp_vectorial_comparison_2
echo "run_xpulp_isa: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=pulp_vectorial_comparison_2 CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=pulp_vectorial_comparison_2 CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/pulp_vectorial_comparison_2/0/xrun-pulp_vectorial_comparison_2.log


failed=0
check_log ${log} "SIMULATION PASSED" pulp_vectorial_comparison_2
incr_test_counts

# --> Test: pulp_vectorial_comparison_3 : Build: uvmt_cv32e40p : pulp_vectorial_comparison_3
# --> Test (Index: 0): make test TEST=pulp_vectorial_comparison_3 CFG=pulp : pulp_vectorial_comparison_3
echo "run_xpulp_isa: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=pulp_vectorial_comparison_3 CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=pulp_vectorial_comparison_3 CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/pulp_vectorial_comparison_3/0/xrun-pulp_vectorial_comparison_3.log


failed=0
check_log ${log} "SIMULATION PASSED" pulp_vectorial_comparison_3
incr_test_counts

# --> Test: pulp_vectorial_complex : Build: uvmt_cv32e40p : pulp_vectorial_complex
# --> Test (Index: 0): make test TEST=pulp_vectorial_complex CFG=pulp : pulp_vectorial_complex
echo "run_xpulp_isa: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=pulp_vectorial_complex CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=pulp_vectorial_complex CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/pulp_vectorial_complex/0/xrun-pulp_vectorial_complex.log


failed=0
check_log ${log} "SIMULATION PASSED" pulp_vectorial_complex
incr_test_counts

# --> Test: pulp_vectorial_dot_product_1 : Build: uvmt_cv32e40p : pulp_vectorial_dot_product_1
# --> Test (Index: 0): make test TEST=pulp_vectorial_dot_product_1 CFG=pulp : pulp_vectorial_dot_product_1
echo "run_xpulp_isa: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=pulp_vectorial_dot_product_1 CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=pulp_vectorial_dot_product_1 CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/pulp_vectorial_dot_product_1/0/xrun-pulp_vectorial_dot_product_1.log


failed=0
check_log ${log} "SIMULATION PASSED" pulp_vectorial_dot_product_1
incr_test_counts

# --> Test: pulp_vectorial_dot_product_2 : Build: uvmt_cv32e40p : pulp_vectorial_dot_product_2
# --> Test (Index: 0): make test TEST=pulp_vectorial_dot_product_2 CFG=pulp : pulp_vectorial_dot_product_2
echo "run_xpulp_isa: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=pulp_vectorial_dot_product_2 CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=pulp_vectorial_dot_product_2 CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/pulp_vectorial_dot_product_2/0/xrun-pulp_vectorial_dot_product_2.log


failed=0
check_log ${log} "SIMULATION PASSED" pulp_vectorial_dot_product_2
incr_test_counts

# --> Test: pulp_vectorial_max : Build: uvmt_cv32e40p : pulp_vectorial_max
# --> Test (Index: 0): make test TEST=pulp_vectorial_max CFG=pulp : pulp_vectorial_max
echo "run_xpulp_isa: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=pulp_vectorial_max CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=pulp_vectorial_max CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/pulp_vectorial_max/0/xrun-pulp_vectorial_max.log


failed=0
check_log ${log} "SIMULATION PASSED" pulp_vectorial_max
incr_test_counts

# --> Test: pulp_vectorial_min : Build: uvmt_cv32e40p : pulp_vectorial_min
# --> Test (Index: 0): make test TEST=pulp_vectorial_min CFG=pulp : pulp_vectorial_min
echo "run_xpulp_isa: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=pulp_vectorial_min CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=pulp_vectorial_min CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/pulp_vectorial_min/0/xrun-pulp_vectorial_min.log


failed=0
check_log ${log} "SIMULATION PASSED" pulp_vectorial_min
incr_test_counts

# --> Test: pulp_vectorial_shift : Build: uvmt_cv32e40p : pulp_vectorial_shift
# --> Test (Index: 0): make test TEST=pulp_vectorial_shift CFG=pulp : pulp_vectorial_shift
echo "run_xpulp_isa: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=pulp_vectorial_shift CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=pulp_vectorial_shift CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/pulp_vectorial_shift/0/xrun-pulp_vectorial_shift.log


failed=0
check_log ${log} "SIMULATION PASSED" pulp_vectorial_shift
incr_test_counts

# --> Test: pulp_vectorial_shuffle_pack : Build: uvmt_cv32e40p : pulp_vectorial_shuffle_pack
# --> Test (Index: 0): make test TEST=pulp_vectorial_shuffle_pack CFG=pulp : pulp_vectorial_shuffle_pack
echo "run_xpulp_isa: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make test TEST=pulp_vectorial_shuffle_pack CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make test TEST=pulp_vectorial_shuffle_pack CFG=pulp CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=0 COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  USE_ISS=YES ISS=spike >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/pulp_vectorial_shuffle_pack/0/xrun-pulp_vectorial_shuffle_pack.log


failed=0
check_log ${log} "SIMULATION PASSED" pulp_vectorial_shuffle_pack
incr_test_counts


echo "run_xpulp_isa: Passing tests: ${pass_count}"
echo "run_xpulp_isa: Failing tests: ${fail_count}"

if [ ${fail_count} -ne 0 ]; then
    exit 1
fi
exit 0