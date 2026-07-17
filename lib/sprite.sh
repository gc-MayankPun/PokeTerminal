#!/usr/bin/env bash

get_sprite_path(){
    if [[ "$CURRENT_SHINY" == "true" ]]; then 
        echo "${SHINY_SPRITE}/${CURRENT_POKEMON_ID}.png"
    else 
        echo "${BASE_SPRITE}/${CURRENT_POKEMON_ID}.png"
    fi
}

display_sprite(){
    local pokemon_sprite=$(get_sprite_path)
    
    if [[ ! -f "$pokemon_sprite" ]]; then
        echo "Missing sprite: $pokemon_sprite"
        return 1
    fi

    kitty +kitten icat --align=left "${pokemon_sprite}"
}
