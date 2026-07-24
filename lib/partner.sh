#!/usr/bin/env bash

calculate_mood() {
  # compute a score with partner friendship
  local mood_score=50
  (( mood_score += PARTNER_FRIENDSHIP / 4 ))

  # mood score based on weather
  if [[ "$CURRENT_WEATHER" == "Sunny" ]]; then (( mood_score += 15 ))
  elif [[ "$CURRENT_WEATHER" == "Rain" ]]; then (( mood_score += 5 ))
  elif [[ "$CURRENT_WEATHER" == "Snow" ]]; then (( mood_score -= 10 ))
  elif [[ "$CURRENT_WEATHER" == "Windy" ]]; then (( mood_score -= 5 ))
  elif [[ "$CURRENT_WEATHER" == "Fog" ]]; then (( mood_score -= 8 ))
  fi

  # mood score based on time
  if [[ "$CURRENT_TIME" == "Morning" ]]; then (( mood_score += 10 ))
  elif [[ "$CURRENT_TIME" == "Afternoon" ]]; then (( mood_score += 5 ))
  elif [[ "$CURRENT_TIME" == "Evening" ]]; then (( mood_score += 2 ))
  elif [[ "$CURRENT_TIME" == "Night" ]]; then (( mood_score -= 10 ))
  fi

  # translate score in mood
  if (( mood_score < 20 )); then PARTNER_MOOD="Sleepy"
  elif (( mood_score < 40 )); then PARTNER_MOOD="Quiet"
  elif (( mood_score < 60 )); then PARTNER_MOOD="Relaxed"
  elif (( mood_score < 80 )); then PARTNER_MOOD="Happy"
  else PARTNER_MOOD="Excited"
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
    PARTNER_SHINY=$(echo "$obj" | jq -r '.shiny')
  fi
}

update_partner() {
  calculate_mood
  # gain_friendship
  # level_up
  # evolve
}
