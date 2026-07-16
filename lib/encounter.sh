#!/usr/bin/env bash

CURRENT_POKEMON=""
CURRENT_SHINY=false
ENCOUNTER_DATE=""

generate_encounter(){
    # Pick a random Pokémon
    CURRENT_POKEMON=$(random_choice "${POKEMON_LIST[@]}")
 
    # Roll chance for Shiny  
    if chance "$SHINY_CHANCE"; then
        CURRENT_SHINY=true
    else
        CURRENT_SHINY=false
    fi

    # Generate date of encounter
    ENCOUNTER_DATE=$(date +%F)
}

save_encounter() {
    mkdir -p "$CACHE_DIR"

    cat > "$CACHE_FILE" <<EOF
CURRENT_POKEMON="$CURRENT_POKEMON"
CURRENT_SHINY="$CURRENT_SHINY"
ENCOUNTER_DATE="$ENCOUNTER_DATE"
EOF
}

load_encounter(){
    source "$CACHE_FILE" 
    
    local today=$(date +%F)
    if [[ "$ENCOUNTER_DATE" != "$today" ]]; then
        generate_encounter
        save_encounter
    fi
}

load_or_generate_encounter() {
    if [[ -f "$CACHE_FILE" ]]; then
        load_encounter
    else
        generate_encounter
        save_encounter
    fi
}

clear_encounter(){
    rm -f "$CACHE_FILE"
}
