#!/usr/bin/env bash

POKEMON_LIST=( 1 4 7 )

load_pokemon() {
  local id="$1"

  PARTNER_POKEMON=$(jq -r --arg id "$id" '.[$id].display_name' "$POKEMON_JSON")
  local type_1=$(jq -r --arg id "$id" '.[$id].types[0]' "$POKEMON_JSON")
  local type_2=$(jq -r --arg id "$id" '.[$id].types[1] // ""' "$POKEMON_JSON")
  TYPE="$type_1${type_2:+, $type_2}"
  RARITY=$(jq -r --arg id "$id" '.[$id].rarity' "$POKEMON_JSON")
}

encounter_pokemon() {
  local id=$(random_choice ${POKEMON_LIST[@]}) 
  local isShiny=false
  local pokemon_lvl=1
  local friendship=0

  if chance "$SHINY_CHANCE"; then
    isShiny=true 
  fi

  pokemon_lvl=5
 
  save_collection $id $pokemon_lvl $friendship $isShiny
  echo $id
}
 