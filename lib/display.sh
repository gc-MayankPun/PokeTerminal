#!/usr/bin/env bash

show_title(){
    echo "
──────────────────────────────────────

            PokeTerminal

──────────────────────────────────────
"
}

show_encounter(){
    if [[ $CURRENT_SHINY == true ]]; then
        echo "A wild shiny ${CURRENT_POKEMON} appeared!"
    else
        echo "A wild ${CURRENT_POKEMON} appeared!"
    fi
    
    display_sprite
}

show_stats(){
    echo "Pokemon: $CURRENT_POKEMON" 
    echo "Shiny: $CURRENT_SHINY"
    echo "Date: $ENCOUNTER_DATE"
}

display_terminal(){
    show_title
    show_encounter
    show_stats
}