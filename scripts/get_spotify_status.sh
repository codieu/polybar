#!/bin/bash

PARENT_BAR="right"
PARENT_BAR_PID=$(pgrep -a "polybar" | grep "$PARENT_BAR" | cut -d" " -f1)

if [[ $1 == "--status" ]]; then

  playing=`spotify_player get key playback | jq .is_playing`

  if [[ $playing == "true" ]]; then
    echo Playing
  else
    echo Paused
  fi

  exit
fi

track=`spotify_player get key playback | jq .item.name | tr -d "\""`

if [[ $track == "null" ]]; then 
  echo no playback \>:3
else
  echo $track
fi
