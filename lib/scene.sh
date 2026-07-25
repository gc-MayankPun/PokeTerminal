#!/usr/bin/env bash

generate_dialogue() {
  local lines=()

  case "$PARTNER_MOOD" in
    Sleepy)
      lines=(
      "😴 $PARTNER_POKEMON keeps rubbing its eyes."
      "🥱 $PARTNER_POKEMON lets out a long yawn."
      "💤 $PARTNER_POKEMON curls up beside the campfire."
      "🌙 $PARTNER_POKEMON blinks slowly at you."
      )
    ;;
    Quiet)
      lines=(
      "🌲 $PARTNER_POKEMON quietly watches the trees."
      "🍃 $PARTNER_POKEMON listens to the wind."
      "👀 $PARTNER_POKEMON seems lost in thought."
      "🌿 $PARTNER_POKEMON sits peacefully beside you."
      )
    ;;
    Relaxed)
      lines=(
      "🙂 $PARTNER_POKEMON stretches beside your tent."
      "🌼 $PARTNER_POKEMON enjoys the peaceful afternoon."
      "☀️ $PARTNER_POKEMON lies comfortably near the fire."
      "🍃 $PARTNER_POKEMON breathes in the fresh forest air."
      )
    ;;
    Happy)
      lines=(
      "😊 $PARTNER_POKEMON hums cheerfully."
      "🎵 $PARTNER_POKEMON greets you with a happy cry."
      "💚 $PARTNER_POKEMON smiles the moment it sees you."
      "✨ $PARTNER_POKEMON happily walks over to you."
      )
    ;;
    Excited)
      lines=(
      "✨ $PARTNER_POKEMON runs circles around camp."
      "⚡ $PARTNER_POKEMON can't wait to explore."
      "🏃 $PARTNER_POKEMON eagerly tugs at your bag."
      "🎉 $PARTNER_POKEMON bounces with excitement."
      )
    ;;
  esac

  SCENE_DIALOGUE=$(random_choice "${lines[@]}")
}

generate_camp_scene() {
  local lines=(
  "🔥 The campfire burns steadily."
  "🪵 Fresh logs have been stacked nearby."
  "🫐 A berry basket sits beside the tent."
  "🍲 A pot of stew simmers over the fire."
  "🎣 Fishing rods lean against a tree."
  "🪑 Wooden stools circle the campfire."
  "🎒 Supplies are neatly packed beside the tent."
  "🌼 Wildflowers sway around the campsite."
  "🧺 A woven basket rests beside the tent."
  "🍄 Mushrooms grow near an old log."
  )

  local count=$((RANDOM % 2 + 1))

  while ((${#SCENE_CAMP[@]} < count)); do
    local line="${lines[RANDOM % ${#lines[@]}]}"

    [[ " ${SCENE_CAMP[*]} " == *" $line "* ]] && continue

    SCENE_CAMP+=("$line")
  done
}

generate_weather_scene() {
  local lines=()

  case "$CURRENT_WEATHER" in
    Rain)
      lines=(
      "🌧 Raindrops tap against the tent."
      "💧 Small puddles gather around the campsite."
      "☔ The fire hisses as rain reaches the edges."
      "🌲 Wet leaves glisten in the forest."
      )
    ;;
    Snow)
      lines=(
      "❄ Snow gathers around the campfire."
      "🌨 Frost clings to the nearby trees."
      "🤍 The whole camp is wrapped in white."
      "🥶 Your breath hangs in the cold air."
      )
    ;;
    Sunny)
      lines=(
      "☀ Sunlight filters through the trees."
      "🌼 Wildflowers open beneath the warm light."
      "🐝 A few Combee buzz around the camp."
      "✨ Everything feels bright and peaceful."
      )
    ;;
    Windy)
      lines=(
      "🍃 Leaves dance around the campsite."
      "🌬 The tent gently flutters in the breeze."
      "🌲 Branches sway overhead."
      "🪶 Feathers drift across the clearing."
      )
    ;;
  esac

  SCENE_LINES+=("${lines[RANDOM % ${#lines[@]}]}")
}

generate_time_scene() {
  local lines=()

  case "$CURRENT_TIME" in
    Morning)
      lines=(
      "🐦 Birds begin their morning song."
      "🌅 The sun peeks over the treetops."
      "☕ The camp slowly wakes up."
      )
    ;;
    Afternoon)
      lines=(
      "🌞 The forest feels lively."
      "🍃 A gentle breeze cools the camp."
      "🦋 Butterfree drift through the clearing."
      )
    ;;
    Evening)
      lines=(
      "🌇 Long shadows stretch across camp."
      "🔥 The campfire grows brighter."
      "🦉 Nocturnal Pokémon begin to stir."
      )
    ;;
    Night)
      lines=(
      "🌙 Fireflies drift through the darkness."
      "⭐ Stars sparkle above the camp."
      "🦗 The forest echoes with quiet chirps."
      )
    ;;
  esac

  SCENE_LINES+=("${lines[RANDOM % ${#lines[@]}]}")
}

generate_partner_scene() {
  local lines=()

  case "$PARTNER_MOOD" in
    Sleepy)
      lines=(
      "😴 $PARTNER_POKEMON curls beside the fire."
      "💤 $PARTNER_POKEMON struggles to stay awake."
      "🥱 A tiny yawn escapes $PARTNER_POKEMON."
      )
    ;;
    Quiet)
      lines=(
      "🌲 $PARTNER_POKEMON quietly watches the trees."
      "👀 $PARTNER_POKEMON listens to the forest."
      "🍂 $PARTNER_POKEMON sits peacefully beside you."
      )
    ;;
    Relaxed)
      lines=(
      "🙂 $PARTNER_POKEMON stretches beside your tent."
      "🌿 $PARTNER_POKEMON enjoys the calm breeze."
      "😌 Everything seems peaceful today."
      )
    ;;
    Happy)
      lines=(
      "😊 $PARTNER_POKEMON hums cheerfully."
      "🎵 A happy little cry echoes through camp."
      "💚 $PARTNER_POKEMON happily follows you around."
      )
    ;;
    Excited)
      lines=(
      "✨ $PARTNER_POKEMON runs circles around camp."
      "⚡ $PARTNER_POKEMON wants to explore."
      "🏃 $PARTNER_POKEMON can't stay still."
      )
    ;;
  esac

  SCENE_LINES+=("${lines[RANDOM % ${#lines[@]}]}")
}

populate_ambience() {
  local ambience=()

  case "$CURRENT_WEATHER" in
    Rain)
      ambience=(
      "Rain taps gently against the tent."
      "The scent of wet earth fills the camp."
      "Soft rainfall masks distant sounds."
      )
    ;;
    Sunny)
      ambience=(
      "The campfire crackles softly."
      "A warm breeze rustles the trees."
      "The forest feels calm today."
      )
    ;;
    Snow)
      ambience=(
      "Snow muffles every sound."
      "Cold air settles around the camp."
      "Only the fire breaks the silence."
      )
    ;;
    Windy)
      ambience=(
      "Leaves rustle overhead."
      "Branches sway with the wind."
      "The breeze carries the scent of pine."
      )
    ;;
  esac

  SCENE_AMBIENCE=$(random_choice "${ambience[@]}")
}

generate_scene() {
  SCENE_LINES=()
  SCENE_CAMP=()

  generate_dialogue

  generate_camp_scene
  generate_weather_scene
  generate_time_scene
  generate_partner_scene

  # generate_event_scene
  # generate_visitor_scene

  populate_ambience
}

render_scene() {
  printf "\n"
  draw_box --no-border "🌿 PokeCamp $(repeat " " 10) $CURRENT_TIME $(repeat " " 10) $CURRENT_SEASON • $CURRENT_WEATHER 🌿"

  printf "\n"
  display_sprite "$PARTNER_ID"
  center_text "$SCENE_DIALOGUE"

  printf "\n"
  draw_box \
    --inside-left \
    --no-border \
    "Camp" \
    "${SCENE_LINES[@]}" \
    "${SCENE_CAMP[@]}"
  printf "\n"

  draw_info_block "Partner" 20 "$PARTNER_POKEMON" "Lv.$PARTNER_LEVEL" "Mood" "$PARTNER_MOOD" "Friendship" "$(draw_friendship_bar $PARTNER_FRIENDSHIP)"

  printf "\n"
  center_text "\"$SCENE_AMBIENCE\""
  printf "\n"
}
