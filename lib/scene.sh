#!/usr/bin/env bash

generate_scene() {
  SCENE_TITLE="Snow quietly blankets the camp."

  SCENE_STATUS="Sleepy"

  SCENE_MESSAGE="It's warm here..."

  SCENE_AMBIENCE="The campfire crackles softly."

  generate_dialogue
}

render_scene() { 
  printf "\n"
  center_text "🌿 PokeCamp 🌿"
  printf "\n"

  center_text "$SCENE_TITLE"
  printf "\n"

  display_sprite "$PARTNER_ID"

  printf "\n"
  center_text "$SCENE_DIALOGUE"
  printf "\n"

  draw_box "" \
    "$SCENE_STATUS" \
    "$SCENE_MESSAGE" \
    ""
  printf "\n" 

  draw_box "" \
    "$PARTNER_POKEMON Lv.$PARTNER_LEVEL" \
    "Friendship $PARTNER_FRIENDSHIP" \
    "$CURRENT_WEATHER" \
    "$CURRENT_SEASON" \
    ""

  printf "\n"
  center_text "$SCENE_AMBIENCE"
  printf "\n"
}
