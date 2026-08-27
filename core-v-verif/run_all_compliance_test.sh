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
        echo "run_all_compliance_test: Test PASSED: ${test_name} Log: ${log}"
    else
        echo "run_all_compliance_test: Test FAILED: ${test_name} Log: ${log}"
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

# Build:uvmt_cv32e40p 
echo "run_all_compliance_test: Running build: [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make comp CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make comp CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  
popd > /dev/null

# Build:uvmt_cv32e40p_compliance_build 
echo "run_all_compliance_test: Running build: [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make all_compliance CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make all_compliance CV_CORE=cv32e40p CFG=default SIMULATOR=xrun COV=  
popd > /dev/null

# --------------------------------------------------------------------------------------
# Tests
# --------------------------------------------------------------------------------------

# --> Test: C-ADD : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-ADD
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-ADD : RISCV_COMPLIANCE_C-ADD
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-ADD CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-ADD CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-ADD/0/xrun-C-ADD.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-ADD/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-ADD
check_log ${compliance_diff_log} "All signatures passed" C-ADD
incr_test_counts

# --> Test: C-ADDI : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-ADDI
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-ADDI : RISCV_COMPLIANCE_C-ADDI
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-ADDI CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-ADDI CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-ADDI/0/xrun-C-ADDI.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-ADDI/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-ADDI
check_log ${compliance_diff_log} "All signatures passed" C-ADDI
incr_test_counts

# --> Test: C-ADDI16SP : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-ADDI16SP
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-ADDI16SP : RISCV_COMPLIANCE_C-ADDI16SP
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-ADDI16SP CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-ADDI16SP CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-ADDI16SP/0/xrun-C-ADDI16SP.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-ADDI16SP/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-ADDI16SP
check_log ${compliance_diff_log} "All signatures passed" C-ADDI16SP
incr_test_counts

# --> Test: C-ADDI4SPN : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-ADDI4SPN
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-ADDI4SPN : RISCV_COMPLIANCE_C-ADDI4SPN
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-ADDI4SPN CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-ADDI4SPN CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-ADDI4SPN/0/xrun-C-ADDI4SPN.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-ADDI4SPN/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-ADDI4SPN
check_log ${compliance_diff_log} "All signatures passed" C-ADDI4SPN
incr_test_counts

# --> Test: C-AND : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-AND
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-AND : RISCV_COMPLIANCE_C-AND
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-AND CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-AND CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-AND/0/xrun-C-AND.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-AND/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-AND
check_log ${compliance_diff_log} "All signatures passed" C-AND
incr_test_counts

# --> Test: C-ANDI : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-ANDI
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-ANDI : RISCV_COMPLIANCE_C-ANDI
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-ANDI CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-ANDI CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-ANDI/0/xrun-C-ANDI.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-ANDI/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-ANDI
check_log ${compliance_diff_log} "All signatures passed" C-ANDI
incr_test_counts

# --> Test: C-BEQZ : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-BEQZ
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-BEQZ : RISCV_COMPLIANCE_C-BEQZ
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-BEQZ CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-BEQZ CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-BEQZ/0/xrun-C-BEQZ.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-BEQZ/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-BEQZ
check_log ${compliance_diff_log} "All signatures passed" C-BEQZ
incr_test_counts

# --> Test: C-BNEZ : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-BNEZ
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-BNEZ : RISCV_COMPLIANCE_C-BNEZ
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-BNEZ CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-BNEZ CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-BNEZ/0/xrun-C-BNEZ.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-BNEZ/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-BNEZ
check_log ${compliance_diff_log} "All signatures passed" C-BNEZ
incr_test_counts

# --> Test: C-J : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-J
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-J : RISCV_COMPLIANCE_C-J
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-J CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-J CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-J/0/xrun-C-J.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-J/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-J
check_log ${compliance_diff_log} "All signatures passed" C-J
incr_test_counts

# --> Test: C-JAL : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-JAL
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-JAL : RISCV_COMPLIANCE_C-JAL
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-JAL CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-JAL CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-JAL/0/xrun-C-JAL.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-JAL/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-JAL
check_log ${compliance_diff_log} "All signatures passed" C-JAL
incr_test_counts

# --> Test: C-JALR : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-JALR
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-JALR : RISCV_COMPLIANCE_C-JALR
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-JALR CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-JALR CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-JALR/0/xrun-C-JALR.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-JALR/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-JALR
check_log ${compliance_diff_log} "All signatures passed" C-JALR
incr_test_counts

# --> Test: C-JR : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-JR
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-JR : RISCV_COMPLIANCE_C-JR
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-JR CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-JR CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-JR/0/xrun-C-JR.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-JR/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-JR
check_log ${compliance_diff_log} "All signatures passed" C-JR
incr_test_counts

# --> Test: C-LI : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-LI
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-LI : RISCV_COMPLIANCE_C-LI
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-LI CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-LI CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-LI/0/xrun-C-LI.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-LI/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-LI
check_log ${compliance_diff_log} "All signatures passed" C-LI
incr_test_counts

# --> Test: C-LUI : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-LUI
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-LUI : RISCV_COMPLIANCE_C-LUI
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-LUI CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-LUI CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-LUI/0/xrun-C-LUI.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-LUI/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-LUI
check_log ${compliance_diff_log} "All signatures passed" C-LUI
incr_test_counts

# --> Test: C-LW : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-LW
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-LW : RISCV_COMPLIANCE_C-LW
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-LW CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-LW CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-LW/0/xrun-C-LW.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-LW/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-LW
check_log ${compliance_diff_log} "All signatures passed" C-LW
incr_test_counts

# --> Test: C-LWSP : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-LWSP
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-LWSP : RISCV_COMPLIANCE_C-LWSP
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-LWSP CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-LWSP CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-LWSP/0/xrun-C-LWSP.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-LWSP/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-LWSP
check_log ${compliance_diff_log} "All signatures passed" C-LWSP
incr_test_counts

# --> Test: C-MV : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-MV
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-MV : RISCV_COMPLIANCE_C-MV
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-MV CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-MV CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-MV/0/xrun-C-MV.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-MV/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-MV
check_log ${compliance_diff_log} "All signatures passed" C-MV
incr_test_counts

# --> Test: C-OR : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-OR
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-OR : RISCV_COMPLIANCE_C-OR
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-OR CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-OR CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-OR/0/xrun-C-OR.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-OR/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-OR
check_log ${compliance_diff_log} "All signatures passed" C-OR
incr_test_counts

# --> Test: C-SLLI : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-SLLI
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-SLLI : RISCV_COMPLIANCE_C-SLLI
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-SLLI CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-SLLI CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-SLLI/0/xrun-C-SLLI.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-SLLI/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-SLLI
check_log ${compliance_diff_log} "All signatures passed" C-SLLI
incr_test_counts

# --> Test: C-SRAI : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-SRAI
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-SRAI : RISCV_COMPLIANCE_C-SRAI
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-SRAI CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-SRAI CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-SRAI/0/xrun-C-SRAI.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-SRAI/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-SRAI
check_log ${compliance_diff_log} "All signatures passed" C-SRAI
incr_test_counts

# --> Test: C-SRLI : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-SRLI
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-SRLI : RISCV_COMPLIANCE_C-SRLI
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-SRLI CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-SRLI CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-SRLI/0/xrun-C-SRLI.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-SRLI/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-SRLI
check_log ${compliance_diff_log} "All signatures passed" C-SRLI
incr_test_counts

# --> Test: C-SUB : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-SUB
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-SUB : RISCV_COMPLIANCE_C-SUB
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-SUB CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-SUB CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-SUB/0/xrun-C-SUB.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-SUB/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-SUB
check_log ${compliance_diff_log} "All signatures passed" C-SUB
incr_test_counts

# --> Test: C-SW : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-SW
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-SW : RISCV_COMPLIANCE_C-SW
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-SW CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-SW CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-SW/0/xrun-C-SW.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-SW/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-SW
check_log ${compliance_diff_log} "All signatures passed" C-SW
incr_test_counts

# --> Test: C-SWSP : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-SWSP
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-SWSP : RISCV_COMPLIANCE_C-SWSP
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-SWSP CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-SWSP CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-SWSP/0/xrun-C-SWSP.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-SWSP/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-SWSP
check_log ${compliance_diff_log} "All signatures passed" C-SWSP
incr_test_counts

# --> Test: C-XOR : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_C-XOR
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-XOR : RISCV_COMPLIANCE_C-XOR
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-XOR CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32imc COMPLIANCE_PROG=C-XOR CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32imc/C-XOR/0/xrun-C-XOR.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32imc/C-XOR/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" C-XOR
check_log ${compliance_diff_log} "All signatures passed" C-XOR
incr_test_counts

# --> Test: DIV : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_DIV
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=DIV : RISCV_COMPLIANCE_DIV
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=DIV CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=DIV CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32im/DIV/0/xrun-DIV.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32im/DIV/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" DIV
check_log ${compliance_diff_log} "All signatures passed" DIV
incr_test_counts

# --> Test: DIVU : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_DIVU
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=DIVU : RISCV_COMPLIANCE_DIVU
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=DIVU CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=DIVU CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32im/DIVU/0/xrun-DIVU.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32im/DIVU/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" DIVU
check_log ${compliance_diff_log} "All signatures passed" DIVU
incr_test_counts

# --> Test: I-ADD-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-ADD-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-ADD-01 : RISCV_COMPLIANCE_I-ADD-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-ADD-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-ADD-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-ADD-01/0/xrun-I-ADD-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-ADD-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-ADD-01
check_log ${compliance_diff_log} "All signatures passed" I-ADD-01
incr_test_counts

# --> Test: I-ADDI-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-ADDI-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-ADDI-01 : RISCV_COMPLIANCE_I-ADDI-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-ADDI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-ADDI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-ADDI-01/0/xrun-I-ADDI-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-ADDI-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-ADDI-01
check_log ${compliance_diff_log} "All signatures passed" I-ADDI-01
incr_test_counts

# --> Test: I-AND-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-AND-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-AND-01 : RISCV_COMPLIANCE_I-AND-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-AND-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-AND-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-AND-01/0/xrun-I-AND-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-AND-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-AND-01
check_log ${compliance_diff_log} "All signatures passed" I-AND-01
incr_test_counts

# --> Test: I-ANDI-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-ANDI-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-ANDI-01 : RISCV_COMPLIANCE_I-ANDI-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-ANDI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-ANDI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-ANDI-01/0/xrun-I-ANDI-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-ANDI-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-ANDI-01
check_log ${compliance_diff_log} "All signatures passed" I-ANDI-01
incr_test_counts

# --> Test: I-AUIPC-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-AUIPC-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-AUIPC-01 : RISCV_COMPLIANCE_I-AUIPC-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-AUIPC-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-AUIPC-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-AUIPC-01/0/xrun-I-AUIPC-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-AUIPC-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-AUIPC-01
check_log ${compliance_diff_log} "All signatures passed" I-AUIPC-01
incr_test_counts

# --> Test: I-BEQ-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-BEQ-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-BEQ-01 : RISCV_COMPLIANCE_I-BEQ-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-BEQ-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-BEQ-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-BEQ-01/0/xrun-I-BEQ-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-BEQ-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-BEQ-01
check_log ${compliance_diff_log} "All signatures passed" I-BEQ-01
incr_test_counts

# --> Test: I-BGE-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-BGE-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-BGE-01 : RISCV_COMPLIANCE_I-BGE-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-BGE-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-BGE-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-BGE-01/0/xrun-I-BGE-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-BGE-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-BGE-01
check_log ${compliance_diff_log} "All signatures passed" I-BGE-01
incr_test_counts

# --> Test: I-BGEU-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-BGEU-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-BGEU-01 : RISCV_COMPLIANCE_I-BGEU-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-BGEU-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-BGEU-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-BGEU-01/0/xrun-I-BGEU-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-BGEU-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-BGEU-01
check_log ${compliance_diff_log} "All signatures passed" I-BGEU-01
incr_test_counts

# --> Test: I-BLT-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-BLT-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-BLT-01 : RISCV_COMPLIANCE_I-BLT-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-BLT-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-BLT-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-BLT-01/0/xrun-I-BLT-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-BLT-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-BLT-01
check_log ${compliance_diff_log} "All signatures passed" I-BLT-01
incr_test_counts

# --> Test: I-BLTU-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-BLTU-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-BLTU-01 : RISCV_COMPLIANCE_I-BLTU-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-BLTU-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-BLTU-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-BLTU-01/0/xrun-I-BLTU-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-BLTU-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-BLTU-01
check_log ${compliance_diff_log} "All signatures passed" I-BLTU-01
incr_test_counts

# --> Test: I-BNE-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-BNE-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-BNE-01 : RISCV_COMPLIANCE_I-BNE-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-BNE-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-BNE-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-BNE-01/0/xrun-I-BNE-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-BNE-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-BNE-01
check_log ${compliance_diff_log} "All signatures passed" I-BNE-01
incr_test_counts

# --> Test: I-CSRRC-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-CSRRC-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32Zicsr COMPLIANCE_PROG=I-CSRRC-01 : RISCV_COMPLIANCE_I-CSRRC-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32Zicsr COMPLIANCE_PROG=I-CSRRC-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32Zicsr COMPLIANCE_PROG=I-CSRRC-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32Zicsr/I-CSRRC-01/0/xrun-I-CSRRC-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32Zicsr/I-CSRRC-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-CSRRC-01
check_log ${compliance_diff_log} "All signatures passed" I-CSRRC-01
incr_test_counts

# --> Test: I-CSRRCI-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-CSRRCI-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32Zicsr COMPLIANCE_PROG=I-CSRRCI-01 : RISCV_COMPLIANCE_I-CSRRCI-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32Zicsr COMPLIANCE_PROG=I-CSRRCI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32Zicsr COMPLIANCE_PROG=I-CSRRCI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32Zicsr/I-CSRRCI-01/0/xrun-I-CSRRCI-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32Zicsr/I-CSRRCI-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-CSRRCI-01
check_log ${compliance_diff_log} "All signatures passed" I-CSRRCI-01
incr_test_counts

# --> Test: I-CSRRS-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-CSRRS-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32Zicsr COMPLIANCE_PROG=I-CSRRS-01 : RISCV_COMPLIANCE_I-CSRRS-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32Zicsr COMPLIANCE_PROG=I-CSRRS-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32Zicsr COMPLIANCE_PROG=I-CSRRS-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32Zicsr/I-CSRRS-01/0/xrun-I-CSRRS-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32Zicsr/I-CSRRS-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-CSRRS-01
check_log ${compliance_diff_log} "All signatures passed" I-CSRRS-01
incr_test_counts

# --> Test: I-CSRRSI-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-CSRRSI-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32Zicsr COMPLIANCE_PROG=I-CSRRSI-01 : RISCV_COMPLIANCE_I-CSRRSI-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32Zicsr COMPLIANCE_PROG=I-CSRRSI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32Zicsr COMPLIANCE_PROG=I-CSRRSI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32Zicsr/I-CSRRSI-01/0/xrun-I-CSRRSI-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32Zicsr/I-CSRRSI-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-CSRRSI-01
check_log ${compliance_diff_log} "All signatures passed" I-CSRRSI-01
incr_test_counts

# --> Test: I-CSRRW-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-CSRRW-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32Zicsr COMPLIANCE_PROG=I-CSRRW-01 : RISCV_COMPLIANCE_I-CSRRW-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32Zicsr COMPLIANCE_PROG=I-CSRRW-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32Zicsr COMPLIANCE_PROG=I-CSRRW-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32Zicsr/I-CSRRW-01/0/xrun-I-CSRRW-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32Zicsr/I-CSRRW-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-CSRRW-01
check_log ${compliance_diff_log} "All signatures passed" I-CSRRW-01
incr_test_counts

# --> Test: I-CSRRWI-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-CSRRWI-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32Zicsr COMPLIANCE_PROG=I-CSRRWI-01 : RISCV_COMPLIANCE_I-CSRRWI-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32Zicsr COMPLIANCE_PROG=I-CSRRWI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32Zicsr COMPLIANCE_PROG=I-CSRRWI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32Zicsr/I-CSRRWI-01/0/xrun-I-CSRRWI-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32Zicsr/I-CSRRWI-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-CSRRWI-01
check_log ${compliance_diff_log} "All signatures passed" I-CSRRWI-01
incr_test_counts

# --> Test: I-DELAY_SLOTS-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-DELAY_SLOTS-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-DELAY_SLOTS-01 : RISCV_COMPLIANCE_I-DELAY_SLOTS-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-DELAY_SLOTS-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-DELAY_SLOTS-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-DELAY_SLOTS-01/0/xrun-I-DELAY_SLOTS-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-DELAY_SLOTS-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-DELAY_SLOTS-01
check_log ${compliance_diff_log} "All signatures passed" I-DELAY_SLOTS-01
incr_test_counts

# --> Test: I-ENDIANESS-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-ENDIANESS-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-ENDIANESS-01 : RISCV_COMPLIANCE_I-ENDIANESS-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-ENDIANESS-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-ENDIANESS-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-ENDIANESS-01/0/xrun-I-ENDIANESS-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-ENDIANESS-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-ENDIANESS-01
check_log ${compliance_diff_log} "All signatures passed" I-ENDIANESS-01
incr_test_counts

# --> Test: I-FENCE.I-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-FENCE.I-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32Zifencei COMPLIANCE_PROG=I-FENCE.I-01 : RISCV_COMPLIANCE_I-FENCE.I-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32Zifencei COMPLIANCE_PROG=I-FENCE.I-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32Zifencei COMPLIANCE_PROG=I-FENCE.I-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32Zifencei/I-FENCE.I-01/0/xrun-I-FENCE.I-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32Zifencei/I-FENCE.I-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-FENCE.I-01
check_log ${compliance_diff_log} "All signatures passed" I-FENCE.I-01
incr_test_counts

# --> Test: I-IO-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-IO-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-IO-01 : RISCV_COMPLIANCE_I-IO-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-IO-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-IO-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-IO-01/0/xrun-I-IO-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-IO-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-IO-01
check_log ${compliance_diff_log} "All signatures passed" I-IO-01
incr_test_counts

# --> Test: I-JAL-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-JAL-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-JAL-01 : RISCV_COMPLIANCE_I-JAL-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-JAL-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-JAL-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-JAL-01/0/xrun-I-JAL-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-JAL-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-JAL-01
check_log ${compliance_diff_log} "All signatures passed" I-JAL-01
incr_test_counts

# --> Test: I-JALR-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-JALR-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-JALR-01 : RISCV_COMPLIANCE_I-JALR-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-JALR-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-JALR-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-JALR-01/0/xrun-I-JALR-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-JALR-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-JALR-01
check_log ${compliance_diff_log} "All signatures passed" I-JALR-01
incr_test_counts

# --> Test: I-LB-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-LB-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-LB-01 : RISCV_COMPLIANCE_I-LB-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-LB-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-LB-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-LB-01/0/xrun-I-LB-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-LB-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-LB-01
check_log ${compliance_diff_log} "All signatures passed" I-LB-01
incr_test_counts

# --> Test: I-LBU-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-LBU-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-LBU-01 : RISCV_COMPLIANCE_I-LBU-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-LBU-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-LBU-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-LBU-01/0/xrun-I-LBU-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-LBU-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-LBU-01
check_log ${compliance_diff_log} "All signatures passed" I-LBU-01
incr_test_counts

# --> Test: I-LH-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-LH-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-LH-01 : RISCV_COMPLIANCE_I-LH-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-LH-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-LH-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-LH-01/0/xrun-I-LH-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-LH-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-LH-01
check_log ${compliance_diff_log} "All signatures passed" I-LH-01
incr_test_counts

# --> Test: I-LHU-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-LHU-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-LHU-01 : RISCV_COMPLIANCE_I-LHU-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-LHU-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-LHU-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-LHU-01/0/xrun-I-LHU-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-LHU-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-LHU-01
check_log ${compliance_diff_log} "All signatures passed" I-LHU-01
incr_test_counts

# --> Test: I-LUI-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-LUI-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-LUI-01 : RISCV_COMPLIANCE_I-LUI-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-LUI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-LUI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-LUI-01/0/xrun-I-LUI-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-LUI-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-LUI-01
check_log ${compliance_diff_log} "All signatures passed" I-LUI-01
incr_test_counts

# --> Test: I-LW-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-LW-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-LW-01 : RISCV_COMPLIANCE_I-LW-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-LW-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-LW-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-LW-01/0/xrun-I-LW-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-LW-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-LW-01
check_log ${compliance_diff_log} "All signatures passed" I-LW-01
incr_test_counts

# --> Test: I-OR-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-OR-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-OR-01 : RISCV_COMPLIANCE_I-OR-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-OR-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-OR-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-OR-01/0/xrun-I-OR-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-OR-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-OR-01
check_log ${compliance_diff_log} "All signatures passed" I-OR-01
incr_test_counts

# --> Test: I-ORI-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-ORI-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-ORI-01 : RISCV_COMPLIANCE_I-ORI-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-ORI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-ORI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-ORI-01/0/xrun-I-ORI-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-ORI-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-ORI-01
check_log ${compliance_diff_log} "All signatures passed" I-ORI-01
incr_test_counts

# --> Test: I-RF_size-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-RF_size-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-RF_size-01 : RISCV_COMPLIANCE_I-RF_size-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-RF_size-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-RF_size-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-RF_size-01/0/xrun-I-RF_size-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-RF_size-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-RF_size-01
check_log ${compliance_diff_log} "All signatures passed" I-RF_size-01
incr_test_counts

# --> Test: I-RF_width-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-RF_width-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-RF_width-01 : RISCV_COMPLIANCE_I-RF_width-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-RF_width-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-RF_width-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-RF_width-01/0/xrun-I-RF_width-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-RF_width-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-RF_width-01
check_log ${compliance_diff_log} "All signatures passed" I-RF_width-01
incr_test_counts

# --> Test: I-RF_x0-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-RF_x0-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-RF_x0-01 : RISCV_COMPLIANCE_I-RF_x0-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-RF_x0-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-RF_x0-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-RF_x0-01/0/xrun-I-RF_x0-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-RF_x0-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-RF_x0-01
check_log ${compliance_diff_log} "All signatures passed" I-RF_x0-01
incr_test_counts

# --> Test: I-SB-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-SB-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SB-01 : RISCV_COMPLIANCE_I-SB-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SB-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SB-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-SB-01/0/xrun-I-SB-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-SB-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-SB-01
check_log ${compliance_diff_log} "All signatures passed" I-SB-01
incr_test_counts

# --> Test: I-SH-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-SH-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SH-01 : RISCV_COMPLIANCE_I-SH-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SH-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SH-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-SH-01/0/xrun-I-SH-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-SH-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-SH-01
check_log ${compliance_diff_log} "All signatures passed" I-SH-01
incr_test_counts

# --> Test: I-SLL-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-SLL-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SLL-01 : RISCV_COMPLIANCE_I-SLL-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SLL-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SLL-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-SLL-01/0/xrun-I-SLL-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-SLL-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-SLL-01
check_log ${compliance_diff_log} "All signatures passed" I-SLL-01
incr_test_counts

# --> Test: I-SLLI-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-SLLI-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SLLI-01 : RISCV_COMPLIANCE_I-SLLI-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SLLI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SLLI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-SLLI-01/0/xrun-I-SLLI-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-SLLI-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-SLLI-01
check_log ${compliance_diff_log} "All signatures passed" I-SLLI-01
incr_test_counts

# --> Test: I-SLT-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-SLT-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SLT-01 : RISCV_COMPLIANCE_I-SLT-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SLT-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SLT-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-SLT-01/0/xrun-I-SLT-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-SLT-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-SLT-01
check_log ${compliance_diff_log} "All signatures passed" I-SLT-01
incr_test_counts

# --> Test: I-SLTI-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-SLTI-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SLTI-01 : RISCV_COMPLIANCE_I-SLTI-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SLTI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SLTI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-SLTI-01/0/xrun-I-SLTI-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-SLTI-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-SLTI-01
check_log ${compliance_diff_log} "All signatures passed" I-SLTI-01
incr_test_counts

# --> Test: I-SLTIU-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-SLTIU-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SLTIU-01 : RISCV_COMPLIANCE_I-SLTIU-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SLTIU-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SLTIU-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-SLTIU-01/0/xrun-I-SLTIU-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-SLTIU-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-SLTIU-01
check_log ${compliance_diff_log} "All signatures passed" I-SLTIU-01
incr_test_counts

# --> Test: I-SLTU-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-SLTU-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SLTU-01 : RISCV_COMPLIANCE_I-SLTU-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SLTU-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SLTU-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-SLTU-01/0/xrun-I-SLTU-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-SLTU-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-SLTU-01
check_log ${compliance_diff_log} "All signatures passed" I-SLTU-01
incr_test_counts

# --> Test: I-SRA-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-SRA-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SRA-01 : RISCV_COMPLIANCE_I-SRA-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SRA-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SRA-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-SRA-01/0/xrun-I-SRA-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-SRA-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-SRA-01
check_log ${compliance_diff_log} "All signatures passed" I-SRA-01
incr_test_counts

# --> Test: I-SRAI-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-SRAI-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SRAI-01 : RISCV_COMPLIANCE_I-SRAI-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SRAI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SRAI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-SRAI-01/0/xrun-I-SRAI-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-SRAI-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-SRAI-01
check_log ${compliance_diff_log} "All signatures passed" I-SRAI-01
incr_test_counts

# --> Test: I-SRL-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-SRL-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SRL-01 : RISCV_COMPLIANCE_I-SRL-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SRL-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SRL-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-SRL-01/0/xrun-I-SRL-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-SRL-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-SRL-01
check_log ${compliance_diff_log} "All signatures passed" I-SRL-01
incr_test_counts

# --> Test: I-SRLI-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-SRLI-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SRLI-01 : RISCV_COMPLIANCE_I-SRLI-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SRLI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SRLI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-SRLI-01/0/xrun-I-SRLI-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-SRLI-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-SRLI-01
check_log ${compliance_diff_log} "All signatures passed" I-SRLI-01
incr_test_counts

# --> Test: I-SUB-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-SUB-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SUB-01 : RISCV_COMPLIANCE_I-SUB-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SUB-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SUB-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-SUB-01/0/xrun-I-SUB-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-SUB-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-SUB-01
check_log ${compliance_diff_log} "All signatures passed" I-SUB-01
incr_test_counts

# --> Test: I-SW-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-SW-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SW-01 : RISCV_COMPLIANCE_I-SW-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SW-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-SW-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-SW-01/0/xrun-I-SW-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-SW-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-SW-01
check_log ${compliance_diff_log} "All signatures passed" I-SW-01
incr_test_counts

# --> Test: I-XOR-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-XOR-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-XOR-01 : RISCV_COMPLIANCE_I-XOR-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-XOR-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-XOR-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-XOR-01/0/xrun-I-XOR-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-XOR-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-XOR-01
check_log ${compliance_diff_log} "All signatures passed" I-XOR-01
incr_test_counts

# --> Test: I-XORI-01 : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_I-XORI-01
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-XORI-01 : RISCV_COMPLIANCE_I-XORI-01
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-XORI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32i COMPLIANCE_PROG=I-XORI-01 CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32i/I-XORI-01/0/xrun-I-XORI-01.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32i/I-XORI-01/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" I-XORI-01
check_log ${compliance_diff_log} "All signatures passed" I-XORI-01
incr_test_counts

# --> Test: MUL : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_MUL
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=MUL : RISCV_COMPLIANCE_MUL
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=MUL CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=MUL CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32im/MUL/0/xrun-MUL.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32im/MUL/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" MUL
check_log ${compliance_diff_log} "All signatures passed" MUL
incr_test_counts

# --> Test: MULH : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_MULH
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=MULH : RISCV_COMPLIANCE_MULH
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=MULH CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=MULH CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32im/MULH/0/xrun-MULH.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32im/MULH/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" MULH
check_log ${compliance_diff_log} "All signatures passed" MULH
incr_test_counts

# --> Test: MULHSU : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_MULHSU
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=MULHSU : RISCV_COMPLIANCE_MULHSU
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=MULHSU CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=MULHSU CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32im/MULHSU/0/xrun-MULHSU.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32im/MULHSU/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" MULHSU
check_log ${compliance_diff_log} "All signatures passed" MULHSU
incr_test_counts

# --> Test: MULHU : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_MULHU
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=MULHU : RISCV_COMPLIANCE_MULHU
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=MULHU CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=MULHU CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32im/MULHU/0/xrun-MULHU.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32im/MULHU/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" MULHU
check_log ${compliance_diff_log} "All signatures passed" MULHU
incr_test_counts

# --> Test: REM : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_REM
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=REM : RISCV_COMPLIANCE_REM
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=REM CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=REM CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32im/REM/0/xrun-REM.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32im/REM/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" REM
check_log ${compliance_diff_log} "All signatures passed" REM
incr_test_counts

# --> Test: REMU : Build: uvmt_cv32e40p_compliance_build : RISCV_COMPLIANCE_REMU
# --> Test (Index: 0): make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=REMU : RISCV_COMPLIANCE_REMU
echo "run_all_compliance_test: Running test [cd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt && make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=REMU CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0  ]"
pushd /home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt > /dev/null
make compliance_check_sig RISCV_ISA=rv32im COMPLIANCE_PROG=REMU CV_CORE=cv32e40p CFG=default COREV=1 SIMULATOR=xrun COMP=0 USE_ISS=spike COV= SEED=random GEN_START_INDEX=0 RUN_INDEX=0   >& /dev/null;
popd > /dev/null


log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/default/rv32im/REMU/0/xrun-REMU.log

compliance_diff_log=/home/rocca/riscv-workspace/core-v-verif/cv32e40p/sim/uvmt/xrun_results/None/rv32im/REMU/0/diff_signatures.log

failed=0
check_log ${log} "SIMULATION PASSED" REMU
check_log ${compliance_diff_log} "All signatures passed" REMU
incr_test_counts


echo "run_all_compliance_test: Passing tests: ${pass_count}"
echo "run_all_compliance_test: Failing tests: ${fail_count}"

if [ ${fail_count} -ne 0 ]; then
    exit 1
fi
exit 0