#!/usr/bin/env bash

source config.sh
source everything

main(){
    load_or_generate_encounter
    display_terminal
}

main