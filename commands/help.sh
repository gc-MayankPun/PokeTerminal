#!/usr/bin/env bash

cat <<'EOF'

🌿 PokeCamp
A cozy Pokémon companion for your terminal.

USAGE
    pokecamp [command] [options]

COMMANDS
    camp                 Show today's camp (default)
    partner              View your current partner
    partner info         Show partner details
    partner set <id>     Change your partner

    visitors             View today's visitors
    catch                Catch today's wild Pokémon

    inventory            Open your inventory
    bag                  Alias for inventory

    help                 Show this help page

EXAMPLES
    pokecamp
    pokecamp partner info
    pokecamp partner set 25
    pokecamp visitors
    pokecamp catch
    pokecamp inventory

COMING SOON
    decorate             Customize your camp
    quests               Complete daily quests
    travel               Visit new locations
    berries              Grow and harvest berries
    crafting             Craft useful items
    fishing              Catch fish at lakes
    mining               Collect rare ores
    trading              Trade with visitors

PROJECT
    https://github.com/gc-MayankPun/PokeTerminal

EOF
