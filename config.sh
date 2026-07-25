#!/usr/bin/env bash

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SPRITES_DIR="$ROOT/pokemon/sprites"
SHINY_SPRITE="$SPRITES_DIR/shiny"
BASE_SPRITE="$SPRITES_DIR/base"

POKEMON_JSON="$ROOT/data/pokemon.json"

SAVE_DIR="$ROOT/save"
CAMP_SAVE="$SAVE_DIR/camp.json"

SHINY_CHANCE=5 