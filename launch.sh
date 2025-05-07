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
