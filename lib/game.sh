#!/usr/bin/env bash

CURRENT_TIME=""
CURRENT_WEATHER=""
CURRENT_SEASON=""
CURRENT_EVENT=""

generate_weather() {
  if [[ "$CURRENT_SEASON" == "Spring" ]]; then
    weather=(Sunny Sunny Sunny Rain Rain Windy)
  elif [[ "$CURRENT_SEASON" == "Summer" ]]; then
    weather=(Sunny Sunny Sunny Sunny Windy Rain)
  elif [[ "$CURRENT_SEASON" == "Autumn" ]]; then
    weather=(Sunny Windy Windy Rain Fog)
  elif [[ "$CURRENT_SEASON" == "Winter" ]]; then
    weather=(Snow Snow Cloudy Windy)
  fi

  CURRENT_WEATHER=$(random_choice "${weather[@]}")
}

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
  local today=$(date +%F)
  # local today="false"
  local saved_day=$(jq -r '.weather.date' "$CAMP_SAVE")
  echo "Saved Date: $saved_day"
  echo "Today Date: $today"

  if [[ "$saved_day" == "$today" ]]; then
    CURRENT_WEATHER=$(jq -r '.weather.type' "$CAMP_SAVE")
    echo "Weather Type: $CURRENT_WEATHER" 
    return
  fi

  generate_weather
}

update_season() {
  local month=$(date +%m) 

  if [[ "$month" == "12" || "$month" == "01" || "$month" == "02" ]]; then
    CURRENT_SEASON="Winter"
  elif [[ "$month" == "03" || "$month" == "04" || "$month" == "05" ]]; then
    CURRENT_SEASON="Spring"
  elif [[ "$month" == "06" || "$month" == "07" || "$month" == "08" ]]; then
    CURRENT_SEASON="Summer"
  elif [[ "$month" == "09" || "$month" == "10" || "$month" == "11" ]]; then
    CURRENT_SEASON="Autumn"
  fi
}

update_world() {
  update_time
  update_season
  update_weather
  update_partner
  # update_camp
}
