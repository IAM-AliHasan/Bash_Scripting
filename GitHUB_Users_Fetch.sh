#!/bin/bash

###############################################################################
# Script Name: list-users-with-read-access.sh
# Description: This script lists GitHub collaborators with "read" (pull) access 
#              to a specified repository using the GitHub API.
# Author: Ali Hassan
# Version: 1.0
#
# Usage:
#   ./list-users-with-read-access.sh <REPO_OWNER> <REPO_NAME>
#     - REPO_OWNER: The username or organization that owns the repository.
#     - REPO_NAME:  The name of the repository.
#
# Requirements:
#   - Bash shell
#   - curl: Command-line tool for sending HTTP requests.
#   - jq: Command-line JSON processor (must be installed).
#   - GitHub personal access token (set in the environment variable $token).
#
# Example:
#   ./list-users-with-read-access.sh IAM-AliHasan my-repo
#
# Notes:
#   - Ensure the personal access token has the necessary scope:
#       - Public repositories: No additional permissions are required.
#       - Private repositories: Use a token with `repo` scope.
#   - For more information, refer to GitHub API documentation:
#     https://docs.github.com/en/rest
###############################################################################

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$username
TOKEN=$token

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

# Main script

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access
