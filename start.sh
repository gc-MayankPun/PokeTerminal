#!/usr/bin/env bash

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$ROOT/config.sh"
source "$ROOT/lib/utils.sh"

source "$ROOT/lib/save.sh"
source "$ROOT/lib/game.sh" 
source "$ROOT/lib/partner.sh"
source "$ROOT/lib/pokemon.sh"
source "$ROOT/lib/sprite.sh"
source "$ROOT/lib/scene.sh"

main() {
  # Load all saved data
  load_game

  # Update the world based on current time/day
  update_world 

  # Build today's scene
  generate_scene

  # Render it
  render_scene

  # Save any changes (friendship, events, etc.)
  # save_game
}

main
