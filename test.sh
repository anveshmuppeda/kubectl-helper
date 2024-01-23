#!/bin/bash

# Run a kubectl command and capture the output
kubectl_output=$(kubectl get pods -A)

# Function to display output in a table
display_in_table() {
    local message="$1"
    local width=80  # Adjust the width based on your needs
    echo "+$(printf "%*s" "$width" | tr ' ' -)+"
    echo "| $(printf "%-*s" "$width" "$message") |"
    echo "+$(printf "%*s" "$width" | tr ' ' -)+"
}

# Display the captured output in a table
display_in_table "kubectl output:"
echo "$kubectl_output" | awk '{printf("| %-20s | %-35s | %-15s | %-10s | %-5s |\n", $1, $2, $3, $4, $5)}' | tail -n +2

echo "test"