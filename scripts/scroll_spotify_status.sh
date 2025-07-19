#!/bin/bash

# see man zscroll(1) for documentation of the following parameters
zscroll -l 14 \
        --delay 0.1 \
        --scroll-padding " 󰎇 " \
        --match-command "`dirname $0`/get_spotify_status.sh --status" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true "`dirname $0`/get_spotify_status.sh" &

wait

