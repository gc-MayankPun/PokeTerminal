#!/usr/bin/env bash

calculate_mood() {
  # Calculate mood based on weather and time
#   echo "$CURRENT_TIME"
#   echo "$CURRENT_WEATHER"
#   echo "$PARTNER_FRIENDSHIP"

  if [[ "$CURRENT_TIME" == "Night" || "$CURRENT_WEATHER" == "Snowy" ]]; then
    PARTNER_MOOD="Sleepy"
  fi

}

gain_friendship() {
  # Gain friendship based on completion of tasks
  echo ""
}

level_up() {
  # Gain level based on completion of tasks
  echo ""
}

evolve() {
  # Evolve based on level and friendship conditions
  echo ""
}

load_partner_data() {
  load_pokemon "$PARTNER_ID"

  local obj
  obj=$(echo "$COLLECTION" | jq -c --argjson pid "$PARTNER_ID" '.[] | select(.id == $pid)')

  if [[ -n "$obj" ]]; then
    PARTNER_LEVEL=$(echo "$obj" | jq -r '.level')
    PARTNER_FRIENDSHIP=$(echo "$obj" | jq -r '.friendship')
  fi
}

update_partner() {
  calculate_mood
  gain_friendship
  level_up
  evolve
}
