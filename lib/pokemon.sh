#!/usr/bin/env bash

load_pokemon() {
    local id="$1"
 
    CURRENT_POKEMON=$(jq -r --arg id "$id" '.[$id].display_name' "$POKEMON_JSON")
    REGION=$(jq -r --arg id "$id" '.[$id].region' "$POKEMON_JSON")
    TYPE1=$(jq -r --arg id "$id" '.[$id].types[0]' "$POKEMON_JSON")
    TYPE2=$(jq -r --arg id "$id" '.[$id].types[1] // ""' "$POKEMON_JSON")
    RARITY=$(jq -r --arg id "$id" '.[$id].rarity' "$POKEMON_JSON")
    QUOTE=$(jq -r --arg id "$id" '.[$id].quote' "$POKEMON_JSON")
}

