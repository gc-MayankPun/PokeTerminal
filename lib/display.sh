#!/usr/bin/env bash

show_title(){
    echo "
╭──────────────────────────────────────────────────────────╮
│                        PokeTerminal                      │
╰──────────────────────────────────────────────────────────╯
"
}

show_encounter(){
    if [[ "$CURRENT_SHINY" == "true" ]]; then
        echo " ✨ A shiny ${CURRENT_POKEMON} appeared!"
    else
        echo " A ${CURRENT_POKEMON} appeared!"
    fi

    display_sprite
}

show_stats(){
    echo "│ Name: $CURRENT_POKEMON                                         │" 
    echo "│ Type: $TYPE1 $TYPE2                                              │"
    echo "│ Region: $REGION                                            │" 
    echo "│ Rarity: $RARITY                                           │" 
    echo "│ Encounter Date: $ENCOUNTER_DATE                               │"
}

show_quote(){
    echo "│     $QUOTE      │"
}

display_terminal(){
    show_title
    show_encounter
    echo "╭──────────────────────────────────────────────────────────╮"
    show_stats
    echo "╰──────────────────────────────────────────────────────────╯"
    echo "╭──────────────────────────────────────────────────────────╮"
    show_quote
    echo "╰──────────────────────────────────────────────────────────╯"
}