#!/usr/bin/env bash

show_title() { 
    box 58 print_centered_row 58 "PokeTerminal"
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
    local width=56
    
    print_row $width "Name: $CURRENT_POKEMON"
    print_row $width "Type: $TYPE1 $TYPE2"
    print_row $width "Region: $REGION"
    print_row $width "Rarity: $RARITY"
    print_row $width "Encounter Date: $ENCOUNTER_DATE"
}

show_quote() { 
    print_wrapped 58 "\"$QUOTE\"" 
}

display_terminal(){
    show_title
    show_encounter
    box 58 show_stats
    box 58 show_quote 
}