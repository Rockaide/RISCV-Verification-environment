#!/bin/bash

# Ensure we're in the correct directory
cd "$(dirname "$0")"

echo "=================================================="
echo "Generating all regression scripts..."
echo "=================================================="
for f in cv32e40p/regress/*.yaml; do
    filename=$(basename "$f")
    base=${filename%.yaml}
    base=${base#cv32e40p_}
    
    if [[ "$base" == "compliance" ]]; then
        out="run_all_compliance.sh"
    elif [[ "$base" == "ci_check" ]]; then
        out="run_ci_check.sh"
    else
        out="run_${base}.sh"
    fi
    
    echo "Generating $out from $filename"
    python3 bin/cv_regress --sh -f "$filename" -o "$out" -s xrun --cfg default --makearg "USE_ISS=YES" --makearg "ISS=spike"
done

echo ""
echo "=================================================="
echo "Running all generated tests..."
echo "=================================================="

total_pass=0
total_fail=0

# Array of scripts to run (you can reorder or add/remove as necessary)
scripts=(
    "run_all_compliance.sh"
    "run_ci_check.sh"
    "run_debug.sh"
    "run_full_covg_no_pulp.sh"
    "run_hello_world.sh"
    "run_interrupt.sh"
    "run_rel_check.sh"
    "run_xpulp_isa.sh"
)

# Create a logs directory for the aggregated runs if needed
mkdir -p logs

for script in "${scripts[@]}"; do
    if [ -f "$script" ]; then
        echo "--------------------------------------------------"
        echo "Running $script"
        echo "--------------------------------------------------"
        
        # Execute script and tee to a log
        log="logs/${script%.sh}.log"
        ./"$script" 2>&1 | tee "$log"
        
        # Extract pass/fail counts
        # The scripts output lines like: 
        # run_all_compliance: Passing tests: 50
        # run_all_compliance: Failing tests: 0
        pass=$(grep "Passing tests:" "$log" | tail -1 | awk -F: '{print $NF}' | tr -d ' ')
        fail=$(grep "Failing tests:" "$log" | tail -1 | awk -F: '{print $NF}' | tr -d ' ')
        
        # Default to 0 if empty
        pass=${pass:-0}
        fail=${fail:-0}
        
        total_pass=$((total_pass + pass))
        total_fail=$((total_fail + fail))
    else
        echo "Warning: $script not found!"
    fi
done

echo ""
echo "=================================================="
echo "Overall Summary"
echo "=================================================="
echo "Total Passing tests: $total_pass"
echo "Total Failing tests: $total_fail"
echo "=================================================="

if [ "$total_fail" -ne 0 ]; then
    exit 1
fi
exit 0
