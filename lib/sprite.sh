#!/usr/bin/env bash

get_sprite_path(){
    isShiny "${SHINY_SPRITE}/${CURRENT_POKEMON_ID}.png" "${BASE_SPRITE}/${CURRENT_POKEMON_ID}.png"
}

display_sprite(){
    local pokemon_sprite=$(get_sprite_path)
    
    if [[ ! -f "$pokemon_sprite" ]]; then
        echo "Missing sprite: $pokemon_sprite"
        return 1
    fi

    kitty +kitten icat --align=left "${pokemon_sprite}"
}
