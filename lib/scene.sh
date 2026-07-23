#!/usr/bin/env bash

generate_scene() {
  SCENE_TITLE="Snow quietly blankets the camp."

  SCENE_STATUS="😴 Sleepy"

  SCENE_MESSAGE="It's warm here..."

  SCENE_AMBIENCE="The campfire crackles softly."

  generate_dialogue
}

render_scene() {
  printf "\n"
  printf "             🌿 PokeCamp 🌿\n\n"

  echo "    $SCENE_TITLE"
  printf "\n"

  display_sprite "$PARTNER_ID"

  printf "\n"
  echo "    $SCENE_DIALOGUE"
  printf "\n" 

  echo "────────────────────────────────────────────────────────"

  printf "\n"
  printf "    %s\n" "$SCENE_STATUS"
  printf "    %s\n" "$SCENE_MESSAGE"
  printf "\n"

  echo "────────────────────────────────────────────────────────"

  printf "\n"
  printf "    $PARTNER_POKEMON Lv.$PARTNER_LEVEL\n"

  printf "    Friendship $PARTNER_FRIENDSHIP\n"
  printf "    $CURRENT_WEATHER\n"
  printf "    $CURRENT_SEASON\n"
  printf "\n"

  echo "────────────────────────────────────────────────────────"

  printf "\n"
  printf "    $SCENE_AMBIENCE\n" ""
  printf "\n"
}
