#!/bin/bash

###########################
# Author:  Ali Hasan
# Date:   11/19/2024

# Description:  This script will be used for the number which are divisible by 3 and 5 and not by the 15. We will take the input between the 1 to 100
# Version: 1

for i in {1..100}; do
    if ( (( i % 3 == 0 )) || (( i % 5 == 0 )) ) && (( i % 15 != 0 )); then
        echo $i
    else
        echo "we have not found any information"
    fi
done
