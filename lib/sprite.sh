#!/usr/bin/env bash

POKEMON_SPRITE=""

get_sprite_path(){
    if [[ "$CURRENT_SHINY" == true ]]; then
        POKEMON_SPRITE="${SPRITES_DIR}/shiny/${CURRENT_POKEMON}.png"
    else
        POKEMON_SPRITE="${SPRITES_DIR}/base/${CURRENT_POKEMON}.png"
    fi
}

display_sprite(){
    get_sprite_path
    kitty +kitten icat "${POKEMON_SPRITE}"
}
