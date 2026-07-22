#!/usr/bin/env bash

generate_scene() {
  generate_dialogue

  # SCENE_TITLE="Good Morning"
  # SCENE_DESCRIPTION="Rain falls gently around the camp."
  # SCENE_DIALOGUE="Riolu splashes through puddles."
  # SCENE_LOCATION="Forest Camp"
}

render_scene() {
  echo "Time: $CURRENT_TIME"
  echo "Weather: $CURRENT_WEATHER"
  echo "Season: $CURRENT_SEASON"

  echo ""

  echo "Title: $SCENE_TITLE"
  echo "Dialogue: $SCENE_DIALOGUE"
  echo "Description: $SCENE_DESCRIPTION"
  echo "Location: $SCENE_LOCATION"
  echo "Event: $SCENE_EVENT"

  echo ""

  echo "Pokemon: $PARTNER_POKEMON"
  echo "Mood: $PARTNER_MOOD"
  display_sprite "$PARTNER_ID"
}
