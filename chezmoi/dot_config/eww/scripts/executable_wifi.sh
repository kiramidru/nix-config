#!/usr/bin/env bash

# List Wi-Fi networks and let the user choose with Rofi
chosen=$(nmcli -t -f IN-USE,SSID,SIGNAL,SECURITY dev wifi list | \
  sed 's/^*//g' | \
  rofi -dmenu -p "Wi-Fi:")

# Exit if no selection
[ -z "$chosen" ] && exit

# Extract SSID (field 2)
ssid=$(echo "$chosen" | cut -d: -f2)

# Try to connect
if nmcli dev wifi connect "$ssid"; then
  notify-send "✅ Connected to $ssid"
else
  # Prompt for password with rofi
  pass=$(rofi -dmenu -password -p "Password for $ssid")
  nmcli dev wifi connect "$ssid" password "$pass" \
    && notify-send "✅ Connected to $ssid" \
    || notify-send "❌ Failed to connect"
fi
