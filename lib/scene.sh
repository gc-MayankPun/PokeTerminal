#!/usr/bin/env bash

generate_scene() {
  echo "Time: $CURRENT_TIME"
  echo "Weather: $CURRENT_WEATHER"
  echo "Mood: $PARTNER_MOOD"

  echo ""

  SCENE_TITLE="Good Morning"
  SCENE_DESCRIPTION="Rain falls gently around the camp."
  SCENE_DIALOGUE="Riolu splashes through puddles."
  SCENE_LOCATION="Forest Camp"

  echo "$SCENE_TITLE"
  echo "$SCENE_DIALOGUE"
  echo "$SCENE_DESCRIPTION"
  echo "$SCENE_LOCATION"
  echo "$SCENE_EVENT"
}

build_scene(){
    generate_scene
}