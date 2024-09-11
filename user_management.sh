#!/bin/bash

###########################
# Author: Ali Hasan
# Date: 09/10/2024
# Description: This script provides a user account management system
#              allowing the addition, deletion, and listing of users.
# Version: 1.0
###########################

# Function to add a user
add_user() {
    read -p "Enter username: " username
    sudo useradd -m $username
    echo "User $username added."
}

# Function to delete a user
delete_user() {
    read -p "Enter username: " username
    sudo userdel -r $username
    echo "User $username deleted."
}

# Function to list users
list_users() {
    cut -d: -f1 /etc/passwd
}

# Main function
main() {
    echo "User Account Management"
    echo "1. Add User"
    echo "2. Delete User"
    echo "3. List Users"
    read -p "Choose an option: " option

    case $option in
        1) add_user ;;
        2) delete_user ;;
        3) list_users ;;
        *) echo "Invalid option" ;;
    esac
}

# Execute the main function
main
