#!/bin/bash

RED='\e[31m'
GREEN='\e[32m'
RESET='\e[0m'

declare -i step=0
declare -i hit_count=0
declare -i miss_count=0
declare -a numbers

while :
do
    echo "Step: ${step}"
    
    my_number=${RANDOM: -1}

    read -p "Please enter number from 0 to 9 (q - quit): " input

    if [[ "${input}" == "q" ]]
    then
        echo "Bye!"
        exit 0
    fi

    if [[ "${input}" =~ ^[0-9]$ ]]
    then
        ((step++))

        if [[ "${input}" == "${my_number}" ]]
        then
            echo -e "${GREEN}Hit!${RESET} My number: ${my_number}"
            ((hit_count++))
        else
            echo -e "${RED}Miss!${RESET} My number: ${my_number}"
            ((miss_count++))
        fi

        total=$(( hit_count + miss_count ))
        hit_percent=$(( hit_count * 100 / total ))
        miss_percent=$(( 100 - hit_percent ))

        echo "Hit: ${hit_percent}%" "Miss: ${miss_percent}%"
        echo -e "Numbers: ${numbers[@]} ${input}"

        if [[ "${input}" == "${my_number}" ]]
        then
            numbers+=("${GREEN}${input}${RESET}")
        else
            numbers+=("${RED}${input}${RESET}")
        fi
    else
        echo "Not a valid input. Please enter a single digit (0-9) or 'q' to quit."
    fi
done
