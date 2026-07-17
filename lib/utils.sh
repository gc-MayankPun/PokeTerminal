#!/usr/bin/env bash

random_choice(){
    local array=("$@")
    echo "${array[RANDOM % ${#array[@]}]}"
}

chance(){
    local percent=$1
    ((RANDOM % 100 < $percent)) 
}
 
repeat() {
    local char="$1"
    local count="$2"

    for ((i=0; i<count; i++)); do
        printf "%s" "$char"
    done
}

box() {
    local width="$1"
    shift

    echo "╭$(repeat "─" "$width")╮"
    "$@"
    echo "╰$(repeat "─" "$width")╯"
}

print_row() {
    local width="$1"
    shift

    printf "│ %-*s │\n" "$width" "$*"
}
 
print_centered_row() {
    local width="$1"
    shift

    local text="$*"

    local left=$(( (width - ${#text}) / 2 ))
    local right=$(( width - ${#text} - left ))

    printf "│%*s%s%*s│\n" \
        "$left" "" \
        "$text" \
        "$right" ""
}
  
print_wrapped() {
    local width="$1"
    shift

    local text="$*"

    # Account for the borders ("│ ")
    local wrap_width=$((width - 4))

    echo "$text" | fold -s -w "$wrap_width" | while read -r line; do
        print_centered_row "$width" "$line"
    done
}