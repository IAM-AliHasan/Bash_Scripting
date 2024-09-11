#!/bin/bash

# Author: Ali Hasan
# Date: 11/19/2024
# Description: This script gathers system parameters for a Linux server.

# Function to display disk usage
disk_usage() {
    echo "Disk Usage:"
    df -h
    echo ""
}

# Function to display memory usage
memory_usage() {
    echo "Memory Usage:"
    free -h
    echo ""
}

# Function to display CPU load
cpu_load() {
    echo "CPU Load:"
    uptime
    echo ""
}

# Function to display network interfaces
network_interfaces() {
    echo "Network Interfaces:"
    ip -brief addr
    echo ""
}

# Function to display running processes
running_processes() {
    echo "Running Processes:"
    ps aux --sort=-%mem | head -n 10
    echo ""
}

# Main function to call all other functions
main() {
    echo "System Parameters Report"
    echo "========================"
    disk_usage
    memory_usage
    cpu_load
    network_interfaces
    running_processes
}

# Execute the main function
main
