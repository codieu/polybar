#!/bin/bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

mkdir /tmp/polybar

polybar --reload left 2>&1 | tee -a /tmp/polybar/left.log & disown
polybar --reload logo 2>&1 | tee -a /tmp/polybar/logo.log & disown
polybar --reload right 2>&1 | tee -a /tmp/polybar/right.log & disown
polybar --reload toggled 2>&1 | tee -a /tmp/polybar/toggled.log & disown

# $! gets the pid of tee so we get the prev pid to target polybar
toggled_pid=`expr $! - 1`

update_toggled () {
  while true; do
    tulip t vpn get --polybar $toggled_pid
    tulip t dnd get --polybar $toggled_pid
    tulip t nl get --polybar $toggled_pid
    sleep 1
  done
}

update_toggled & disown
