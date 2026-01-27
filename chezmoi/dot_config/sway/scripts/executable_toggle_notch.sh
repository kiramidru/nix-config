#!/usr/bin/env bash

current="$(eww get notch_state)"
echo $current
if [ "$current" = "window" ]; then
  eww update notch_state="power"
else
  eww update notch_state="window"
fi
