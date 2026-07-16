#!/usr/bin/env bash

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CACHE_DIR="$ROOT/data/cache"
CACHE_FILE="$CACHE_DIR/encounter.conf"
SPRITES_DIR="$ROOT/pokemon/sprites"
SHINY_CHANCE=5