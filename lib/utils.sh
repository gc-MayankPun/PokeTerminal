#!/usr/bin/env bash

random_choice(){
    local array=("$@")
    echo "${array[RANDOM % ${#array[@]}]}"
}

chance(){
    local percent=$1
    ((RANDOM % 100 < $percent)) 
}