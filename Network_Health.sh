#!/bin/bash

###########################
# Author: Ali Hasan
# Date: 09/10/2024
# Description: This script performs a network health check by 
#              checking latency, bandwidth usage, and network interfaces.
# Version: 1.0
###########################

# List of critical network devices
devices=("8.8.8.8" "1.1.1.1" )

# Function to check network latency
check_latency() {
    echo "Checking network latency..."
    for device in "${devices[@]}"; do
        echo "Pinging $device..."
        ping -c 4 $device | grep 'avg'
        echo ""
    done
}

# Function to check bandwidth usage
check_bandwidth() {
    echo "Checking bandwidth usage..."
    ifstat -t 1 1
    echo ""
}

# Function to check network interfaces
check_interfaces() {
    echo "Checking network interfaces..."
    ip -brief addr
    echo ""
}

# Main function
main() {
    echo "Network Health Check Report"
    echo "==========================="
    check_latency
    check_bandwidth
    check_interfaces
}

# Execute the main function
main
