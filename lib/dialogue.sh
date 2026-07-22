#!/usr/bin/env bash

generate_dialogue() {
  if [[ "$PARTNER_MOOD" == "Sleepy" ]]; then
    SCENE_DIALOGUE="$PARTNER_POKEMON yawns beside the campsite."
  elif [[ "$PARTNER_MOOD" == "Quiet" ]]; then
    SCENE_DIALOGUE="$PARTNER_POKEMON quietly watches the trees."
  elif [[ "$PARTNER_MOOD" == "Relaxed" ]]; then
    SCENE_DIALOGUE="$PARTNER_POKEMON stretches beside your tent."
  elif [[ "$PARTNER_MOOD" == "Happy" ]]; then
    SCENE_DIALOGUE="$PARTNER_POKEMON smiles as you arrive."
  elif [[ "$PARTNER_MOOD" == "Excited" ]]; then
    SCENE_DIALOGUE="$PARTNER_POKEMON runs circles around the campsite."
  fi
}
