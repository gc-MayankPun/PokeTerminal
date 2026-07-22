#!/usr/bin/env bash

CURRENT_TIME=""
CURRENT_WEATHER=""
CURRENT_SEASON=""

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
  local weather=("Rainy" "Sunny" "Sandstorm" "Snowy" "Windy")
  CURRENT_WEATHER="$(random_choice "${weather[@]}")"
}

update_season() {
  local season=("Spring" "Summer" "Autumn" "Winter")
  CURRENT_SEASON="$(random_choice "${season[@]}")"
}

update_world() {
  update_time
  update_weather
  update_season
  load_partner_data
  update_partner
}
