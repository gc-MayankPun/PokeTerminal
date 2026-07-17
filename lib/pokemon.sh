#!/usr/bin/env bash

load_pokemon() {
    local id="$1"
 
    CURRENT_POKEMON=$(jq -r --arg id "$id" '.[$id].display_name' "$POKEMON_JSON")
    REGION=$(jq -r --arg id "$id" '.[$id].region' "$POKEMON_JSON")
    local type_1=$(jq -r --arg id "$id" '.[$id].types[0]' "$POKEMON_JSON")
    local type_2=$(jq -r --arg id "$id" '.[$id].types[1] // ""' "$POKEMON_JSON")
    TYPE="$type_1${type_2:+, $type_2}"
    RARITY=$(jq -r --arg id "$id" '.[$id].rarity' "$POKEMON_JSON")
    QUOTE=$(jq -r --arg id "$id" '.[$id].quote' "$POKEMON_JSON")
}

isShiny(){
    [[ "$CURRENT_SHINY" == "true" ]] && echo "$1" || echo "$2"
}