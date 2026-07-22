#!/usr/bin/env bash

declare -A CAMP
load_camp() {
  CAMP["level"]=$(jq -r '.camp.level' "$CAMP_SAVE")
  CAMP["xp"]=$(jq -r '.camp.xp' "$CAMP_SAVE")
  CAMP["theme"]=$(jq -r '.camp.theme' "$CAMP_SAVE")
  CAMP["season"]=$(jq -c '.camp.season' "$CAMP_SAVE")
  CAMP["weather"]=$(jq -c '.camp.weather' "$CAMP_SAVE")
  CAMP["decorations"]=$(jq -c '.camp.decorations' "$CAMP_SAVE")
}

load_partner() {
  PARTNER_ID=$(jq -r ".partner" "$CAMP_SAVE")
}

load_collection() {
  COLLECTION=$(jq -c '.collections' "$CAMP_SAVE")
  # echo "$COLLECTION" | jq '.[1]'
}

load_game() {
  # Load camp details
  load_camp

  # Load collection details
  load_collection

  # Load partner details
  load_partner

  # Load partner details
  load_partner_data
}

# save_game() {
    # jq '.camp.level = "$NEW_CAMP_LEVEL"' "$CAMP_SAVE" > tmp.json && mv tmp.json "$CAMP_SAVE"
    # jq '.camp.xp = "$NEW_CAMP_XP"' "$CAMP_SAVE" > tmp.json && mv tmp.json "$CAMP_SAVE"
    # jq '.camp.partner = "$NEW_PARTNER_ID"' "$CAMP_SAVE" > tmp.json && mv tmp.json "$CAMP_SAVE"
# }
