#!/usr/bin/env bash

get_sprite_path(){
    if [[ "$CURRENT_SHINY" == true ]]; then
        echo "${SPRITES_DIR}/shiny/${CURRENT_POKEMON}.png"
    else
        echo "${SPRITES_DIR}/base/${CURRENT_POKEMON}.png"
    fi
}

display_sprite(){
    local pokemon_sprite=$(get_sprite_path)
    
    if [[ ! -f "$pokemon_sprite" ]]; then
        echo "Missing sprite: $pokemon_sprite"
        return 1
    fi

    kitty +kitten icat "${pokemon_sprite}"
}
