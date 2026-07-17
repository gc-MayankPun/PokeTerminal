#!/usr/bin/env bash

generate_encounter(){
    local MIN_ID=1
    local MAX_ID=$(jq 'length' "$POKEMON_JSON")
    
    # Pick a random Pokémon
    CURRENT_POKEMON_ID=$(( RANDOM % ($MAX_ID - MIN_ID + 1) + $MIN_ID ))
 
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
CURRENT_POKEMON_ID="$CURRENT_POKEMON_ID"
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
