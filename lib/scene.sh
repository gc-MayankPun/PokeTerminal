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
  draw_box --no-border "🌿 PokeCamp $(repeat " " 10) Night $(repeat " " 10) Summer • Windy 🌿"

  display_sprite "$PARTNER_ID"
  center_text "$SCENE_DIALOGUE"

  printf "\n"
  draw_box --inside-left --no-border "Camp" \
    "🔥 The campfire burns steadily." \
    "🪵 Someone added fresh logs." \
    "🫐 A berry basket sits beside the tent."

  printf "\n"

  draw_info_block "Partner" 20 "$PARTNER_POKEMON" "Lv.$PARTNER_LEVEL" "Mood" "Relaxed" "Friendship" "$(draw_friendship_bar $PARTNER_FRIENDSHIP)"

  printf "\n"
  center_text "$SCENE_AMBIENCE"
  printf "\n"
}
