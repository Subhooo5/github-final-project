#!/bin/bash
# simple-interest.sh
# Calculates simple interest from principal, rate of interest and time period.
# Formula: SI = (P * R * T) / 100

echo "Simple Interest Calculator"
echo "--------------------------"

read -p "Enter the principal amount: " principal
read -p "Enter the rate of interest (%): " rate
read -p "Enter the time period (years): " time

# Validate that each input is a non-negative number
for value in "$principal" "$rate" "$time"; do
    if ! [[ "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        echo "Error: '$value' is not a valid non-negative number."
        exit 1
    fi
done

simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

echo "--------------------------"
echo "Principal        : $principal"
echo "Rate of Interest : $rate%"
echo "Time Period      : $time year(s)"
echo "Simple Interest  : $simple_interest"
echo "Total Amount     : $total_amount"
