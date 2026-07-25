#!/usr/bin/env bash

# Camp
declare -A CAMP

# Weather Save
WEATHER_DATE=""
WEATHER_TYPE=""

# Partner
PARTNER_ID=""

# Collection
COLLECTION=""

load_camp() {
  CAMP["level"]=$(jq -r '.camp.level' "$CAMP_SAVE")
  CAMP["xp"]=$(jq -r '.camp.xp' "$CAMP_SAVE")
  CAMP["theme"]=$(jq -r '.camp.theme' "$CAMP_SAVE")
  CAMP["decorations"]=$(jq -c '.camp.decorations' "$CAMP_SAVE")
}

load_weather() {
  WEATHER_DATE=$(jq -r '.weather.date' "$CAMP_SAVE")
  WEATHER_TYPE=$(jq -r '.weather.type' "$CAMP_SAVE")
}

load_partner() {
  PARTNER_ID=$(jq -r ".partner" "$CAMP_SAVE")

  if [[ "$PARTNER_ID" == "null" ]]; then
    PARTNER_ID=$(encounter_pokemon)
  fi
}

load_collection() {
  COLLECTION=$(jq -c '.collections' "$CAMP_SAVE")
  # echo "$COLLECTION" | jq '.[1]'
}

save_camp() {
  tmp=$(mktemp)

  jq \
    --argjson level "${CAMP[level]}" \
    --argjson xp "${CAMP[xp]}" \
    '
    .camp.level = $level
    | .camp.xp = $xp
    ' \
    "$CAMP_SAVE" > "$tmp"

  mv "$tmp" "$CAMP_SAVE"
}

save_weather() {
  tmp=$(mktemp)

  jq \
    --arg date "$WEATHER_DATE" \
    --arg type "$CURRENT_WEATHER" \
    '
    .weather.date = $date
    | .weather.type = $type
    ' \
    "$CAMP_SAVE" > "$tmp"

  mv "$tmp" "$CAMP_SAVE"
}

save_partner() {
  tmp=$(mktemp)

  jq \
    --argjson id "$PARTNER_ID" \
    '
    .partner = $id
    ' \
    "$CAMP_SAVE" > "$tmp"

  mv "$tmp" "$CAMP_SAVE"
}

save_collection() {
  local tmp id level friendship shiny
  tmp=$(mktemp)

  id=$1
  level=$2
  friendship=$3
  shiny=$4

  jq \
    --argjson id "$id" \
    --argjson level $level \
    --argjson friendship $friendship \
    --arg shiny "$shiny" \
    '
    .collections += [{
      id: $id,
      level: $level,
      friendship: $friendship,
      shiny: $shiny
    }]
    ' \
    "$CAMP_SAVE" > "$tmp"

  mv "$tmp" "$CAMP_SAVE"
}

load_game() {
  load_camp
  load_weather
  load_partner
  load_collection
  load_partner_data
}

save_game() {
  save_camp
  save_weather
  save_partner
  # save_collection
}
