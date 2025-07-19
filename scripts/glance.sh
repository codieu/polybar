#!/bin/bash

PARENT_BAR="glance"
PARENT_BAR_PID=$(pgrep -a "polybar" | grep "$PARENT_BAR" | cut -d" " -f1)

show_bar() {
  polybar-msg -p $PARENT_BAR_PID cmd show > /dev/null
}

hide_bar() {
  polybar-msg -p $PARENT_BAR_PID cmd hide > /dev/null
}


PACKET_LOSS=`ping 9.9.9.9 -c 6 -f -i 0.002 | grep "packets transmitted" | awk '{print $6}' | tr -d '%'`
if [ $PACKET_LOSS -gt "50" ]; then
  showbar="Pcket loss high [$PACKET_LOSS%]"
fi

if ping 9.9.9.9 -c 1 -i 0.002 | grep "Network is unreachable"; then
  showbar="Intyernet down"
fi

BAT="BAT1"
BAT_LVL=`cat /sys/class/power_supply/$BAT/capacity`
if [ $BAT_LVL -lt "15" ]; then
  showbar="POWER LOW ($BAT_LVL%)"
fi

if [ ! -z "$showbar" ]; then
  echo $showbar
  show_bar
else
  hide_bar 
fi
