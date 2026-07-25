#!/usr/bin/env bash

center_text() {
  local text="$1"
  local width=$(tput cols)
  local padding=$(( (width - ${#text}) / 2 ))
    
  printf "%*s%s\n" "$padding" "" "$text"
}

draw_box() {
  local align="center"
  local border=true

  while [[ "$1" == --* ]]; do
    case "$1" in
      --left)         align="left" ;;
      --center)       align="center" ;;
      --inside-left)  align="center-left" ;;
      --no-border)    border=false ;;
    esac
    shift
  done

  local -a lines=("$@")
  local term_width
  term_width=$(tput cols)

  local max_len=0
  for line in "${lines[@]}"; do
    (( ${#line} > max_len )) && max_len=${#line}
  done

  local width=$((max_len + 4))
  local box_pad=$(( (term_width - width - 2) / 2 ))
  (( box_pad < 0 )) && box_pad=0
  local indent
  indent=$(printf "%*s" "$box_pad" "")

  if $border; then
    printf "%s╭" "$indent"
    printf '─%.0s' $(seq 1 "$width")
    printf "╮\n"
  fi

  for line in "${lines[@]}"; do
    case "$align" in

      left)
        local rpad=$(( width - ${#line} - 2 ))
        (( rpad < 0 )) && rpad=0
        if $border; then
          printf "│ %s%*s │\n" "$line" "$rpad" ""
        else
          printf "%s\n" "$line"
        fi
        ;;

      center-left)
        local rpad=$(( width - ${#line} - 2 ))
        (( rpad < 0 )) && rpad=0
        if $border; then
          printf "%s│ %s%*s │\n" \
            "$indent" "$line" "$rpad" ""
        else
          printf "%s%s\n" "$indent" "$line"
        fi
        ;;

      center)
        local pad=$(( (width - ${#line}) / 2 ))
        local rpad=$(( width - ${#line} - pad ))
        (( pad < 0 )) && pad=0
        (( rpad < 0 )) && rpad=0
        if $border; then
          printf "%s│%*s%s%*s│\n" \
            "$indent" "$pad" "" "$line" "$rpad" ""
        else
          printf "%s%*s%s\n" \
            "$indent" "$pad" "" "$line"
        fi
        ;;

    esac
  done

  if $border; then
    printf "%s╰" "$indent"
    printf '─%.0s' $(seq 1 "$width")
    printf "╯\n"
  fi
}

draw_info_block() {
  local title="$1"; shift
  local col_gap="${1:-16}"   # default gap matches your screenshot; override by passing a number first
  [[ "$1" =~ ^[0-9]+$ ]] && shift

  local -a labels=() values=()
  local i=0
  for arg in "$@"; do
    if (( i % 2 == 0 )); then
      labels+=("$arg")
    else
      values+=("$arg")
    fi
    (( i++ ))
  done

  local n=${#labels[@]}

  local label_col=0
  for (( c=0; c<n; c++ )); do
    (( ${#labels[c]} > label_col )) && label_col=${#labels[c]}
  done
  label_col=$(( label_col + col_gap ))

  local max_value=0
  for (( c=0; c<n; c++ )); do
    (( ${#values[c]} > max_value )) && max_value=${#values[c]}
  done
  local block_width=$(( label_col + max_value ))
  (( ${#title} > block_width )) && block_width=${#title}

  local term_width
  term_width=$(tput cols)
  local indent_n=$(( (term_width - block_width) / 2 ))
  (( indent_n < 0 )) && indent_n=0
  local indent; indent=$(printf "%*s" "$indent_n" "")

  printf "%s%s\n" "$indent" "$title"
  for (( c=0; c<n; c++ )); do
    printf "%s%-*s%s\n" "$indent" "$label_col" "${labels[c]}" "${values[c]}"
  done
}

visual_len() {
  local str="$1"
  local len=0 i char cp
  for (( i=0; i<${#str}; i++ )); do
    char="${str:i:1}"
    printf -v cp '%d' "'$char"
    if (( cp > 0x1100 )); then
      len=$(( len + 2 ))
    else
      len=$(( len + 1 ))
    fi
  done
  echo "$len"
}

draw_split() {
  local left="$1"
  local right="$2"
  local width
  local H_PAD="$3"

  width=$(tput cols)

  local content_width=$(( width - (H_PAD * 2) ))
  local left_len right_len
  left_len=$(visual_len "$left")
  right_len=$(visual_len "$right")

  local gap=$(( content_width - left_len - right_len ))

  if (( gap < 1 )); then
    right=""
    right_len=0
    gap=$(( content_width - left_len ))
    (( gap < 1 )) && { left=""; gap=$content_width; }
  fi

  local pad; pad=$(printf "%*s" "$H_PAD" "")
  printf "%s%s%*s%s%s\n" "$pad" "$left" "$gap" "" "$right" "$pad"
}

repeat() {
  local char="$1"
  local len="$2"
  local out=""

  for (( i=0; i<len; i++ )); do
    out+="$char"
  done

  printf "%s" "$out"
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