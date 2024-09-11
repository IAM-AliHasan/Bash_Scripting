#!/bin/bash

###########################
# Author: Ali Hasan
# Date: 09/10/2024
# Description: This script analyzes a log file for specific patterns
#              and sends an email alert if the pattern is found.
# Version: 1.0
###########################

# Log file to monitor
log_file="/var/log/syslog"

# Pattern to search for
pattern="ERROR"

# Function to analyze log file
analyze_log() {
    # Search for the pattern in the log file and save results to a temporary file ,place the pattern you want to find in the log_file which contains the actual content .
    grep $pattern $log_file > /tmp/error_log.txt
    
    # Check if the temporary file is not empty
    if [ -s /tmp/error_log.txt ]; then
        # Send an email alert with the contents of the temporary file
        echo "Errors found in log file:" | mail -s "Log Alert" admin@example.com < /tmp/error_log.txt
    fi
}

# Main function
main() {
    analyze_log
}

# Execute the main function
main
