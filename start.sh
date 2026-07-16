#!/usr/bin/env bash

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$ROOT/config.sh"
source "$ROOT/data/pokemon.sh"
source "$ROOT/lib/display.sh"
source "$ROOT/lib/encounter.sh"
source "$ROOT/lib/utils.sh"
source "$ROOT/lib/sprite.sh"
source "$ROOT/lib/display.sh"

main(){
    load_or_generate_encounter
    display_terminal
}

main