#!/usr/bin/env bash

random_choice() {
  local array=("$@")
  echo "${array[RANDOM % ${#array[@]}]}"
}

chance() {
  local percent=$1
  ((RANDOM % 100 < $percent))
}
 
draw_friendship_bar() {
  local friendship=$1
  local max_friendship=255
  local total_blocks="${2:-9}"    

  local percentage=$(( friendship * 100 / max_friendship ))
  local filled=$(( friendship * total_blocks / max_friendship ))
  (( filled == 0 && friendship > 0 )) && filled=1
  (( filled > total_blocks )) && filled=$total_blocks
  local empty=$(( total_blocks - filled ))

  local bar=""
  for (( i=0; i<filled; i++ )); do bar+="■"; done
  for (( i=0; i<empty; i++ )); do bar+="□"; done

  echo "$bar ${percentage}%"
}