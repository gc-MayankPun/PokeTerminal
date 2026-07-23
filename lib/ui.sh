#!/usr/bin/env bash

center_text() {
  local text="$1"
  local width=$(tput cols)
  local padding=$(( (width - ${#text}) / 2 ))
    
  printf "%*s%s\n" "$padding" "" "$text"
}

draw_box() {
  local width=60
  local -a lines=("$@")
  local term_width=$(tput cols)
  local box_pad=$(( (term_width - width - 2) / 2 ))
  local indent; indent=$(printf "%*s" "$box_pad" "")

  printf "%s┌" "$indent"; printf '─%.0s' $(seq 1 "$width"); printf "┐\n"
  for line in "${lines[@]}"; do
    local pad=$(( (width - ${#line}) / 2 ))
    local rpad=$(( width - ${#line} - pad ))
    (( pad < 0 )) && pad=0
    (( rpad < 0 )) && rpad=0
    printf "%s│%*s%s%*s│\n" "$indent" "$pad" "" "$line" "$rpad" ""
  done
  printf "%s└" "$indent"; printf '─%.0s' $(seq 1 "$width"); printf "┘\n"
}
