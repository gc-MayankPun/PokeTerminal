#!/usr/bin/env bash

get_sprite_path() {
  if [[ "$PARTNER_SHINY" == "true" ]]; then
    echo "${SHINY_SPRITE}/$1.png"
  else
    echo "${BASE_SPRITE}/$1.png"
  fi
}

display_sprite() {
  local pokemon_sprite=$(get_sprite_path "$1")

  if [[ ! -f "$pokemon_sprite" ]]; then
    echo "Missing sprite: $pokemon_sprite"
    return 1
  fi

  kitty +kitten icat --align=center "${pokemon_sprite}"
}
