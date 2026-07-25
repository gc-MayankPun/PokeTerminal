#!/usr/bin/env bash
 
case "$1" in
  set)
    id="$2"

    # validate

    echo "Partner changed."
  ;;

  info)
    echo "Partner: $PARTNER_POKEMON" 
  ;;

  *)
    echo "Usage:"
    echo "  pokecamp partner info"
    echo "  pokecamp partner set <id>"
  ;;
esac
