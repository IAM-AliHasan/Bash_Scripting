#!/bin/bash

###########################
# Author: Ali Hasan
# Date: 09/10/2024
# Description: This script performs a security audit by checking open ports,
#              outdated packages, and potential vulnerabilities on a CentOS system.
# Version: 1.0
###########################

# Function to check open ports
check_open_ports() {
    echo "Open Ports:"
    netstat -tuln
    echo ""
}

# Function to check for outdated packages
check_outdated_packages() {
    echo "Outdated Packages:"
    sudo yum check-update
    echo ""
}

# Function to check for potential vulnerabilities
check_vulnerabilities() {
    echo "Potential Vulnerabilities:"
    sudo lynis audit system
    echo ""
}

# Main function
main() {
    echo "Security Audit Report"
    echo "====================="
    check_open_ports
    check_outdated_packages
    check_vulnerabilities
}

# Execute the main function
main
