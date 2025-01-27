#!/bin/bash

packc=`pacman -Qu | wc -l`

if [[ "$1" == "--execif" ]]; then
  if [[ "$packc" == "0" ]]; then 
    exit 1
  fi
  exit
fi

echo "$packc "
