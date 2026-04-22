#!/usr/bin/env sh

stdbuf -oL swaymsg -m -t subscribe '["window", "workspace"]' |
stdbuf -oL jq -r '
  select(.change == "focus" or .change == "title" or .change == "close") | .container.name// "kira@nix"
'
