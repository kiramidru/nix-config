#!/usr/bin/env sh

stdbuf -oL swaymsg -m -t subscribe '["workspace"]' |
stdbuf -oL jq -r 'select(.change == "focus") | .current.num'

