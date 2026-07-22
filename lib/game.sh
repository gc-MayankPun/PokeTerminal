#!/usr/bin/env bash

CURRENT_TIME=""
CURRENT_WEATHER="Sunny"
WEATHER_CHANGE_TIME=0
CURRENT_SEASON="Summer"
SEASON_CHANGE_TIME=0

update_time() {
  local hour=$(date +%H)

  if (( hour < 6 )); then
    CURRENT_TIME="Night"
  elif (( hour < 12 )); then
    CURRENT_TIME="Morning"
  elif (( hour < 18 )); then
    CURRENT_TIME="Afternoon"
  else
    CURRENT_TIME="Evening"
  fi
}

update_weather() {
  local minute=$((10#$(date +%M)))

  if (( minute > WEATHER_CHANGE_TIME + 15 )); then
    local weather=("Rainy" "Sunny" "Sandstorm" "Snowy" "Windy")
    CURRENT_WEATHER="$(random_choice "${weather[@]}")"
    WEATHER_CHANGE_TIME="$minute"
    ((SEASON_CHANGE_TIME++))
  fi
}

update_season() {
  if (( SEASON_CHANGE_TIME >= 4)); then
    local season=("Spring" "Summer" "Autumn" "Winter")
    CURRENT_SEASON="$(random_choice "${season[@]}")"
    SEASON_CHANGE_TIME=0
  fi
}

update_world() {
  update_time
  update_weather
  update_season
  update_partner
  # update_camp
}
