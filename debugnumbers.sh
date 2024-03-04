#!/bin/bash

# Initialize variables
operation=""
debug=false
result=0
numbers=()

# to run the script first do chmod +x

# Get username
username=$(whoami)

# Get script name
script_name=$(basename "$0")

# Function to perform arithmetic operations
perform_operation() {
    local operator=$1
    shift
    local operands=("$@")

    case $operator in
        "+")
            for num in "${operands[@]}"; do
                ((result += num))
            done
            ;;
        "-")
            result=${operands[0]}
            for ((i = 1; i < ${#operands[@]}; i++)); do
                ((result -= ${operands[i]}))
            done
            ;;
        "*")
            result=1
            for num in "${operands[@]}"; do
                ((result *= num))
            done
            ;;
        "%")
            result=${operands[0]}
            for ((i = 1; i < ${#operands[@]}; i++)); do
                ((result %= ${operands[i]}))
            done
            ;;
        *)
            echo "Invalid operator: $operator"
            exit 1
            ;;
    esac
}

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -o)
            operation=$2
            shift 2
            ;;
        -n)
            shift
            while [[ $# -gt 0 && "$1" != "-d" ]]; do
                numbers+=("$1")
                shift
            done
            ;;
        -d)
            debug=true
            shift
            ;;
        *)
            echo "Invalid argument: $1"
            exit 1
            ;;
    esac
done

# Perform the operation
perform_operation "$operation" "${numbers[@]}"

# Output additional information if debug flag is set
if [ "$debug" = true ]; then
    echo "User: $username"
    echo "Script: $script_name"
    echo "Operation: $operation"
    echo "Numbers: ${numbers[*]}"
fi

# Output the result
echo "Result: $result"
