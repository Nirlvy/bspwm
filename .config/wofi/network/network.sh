#!/bin/bash


CFG="$HOME/.config/wofi/network/config"
STYLE="$HOME/.config/wofi/style.css"


# connect() {
  ssid=$(nmcli device wifi list | sed -n '1!p' | cut -b 28- | wofi -c "$CFG" -s "$STYLE" --show dmenu --prompt "Scanning networks..." | cut -d' ' -f3)
  if [[ ! -z "$ssid" ]];then
    pass=$(echo -e 'Type password for connection "$ssid"' | wofi -c "$CFG" -s "$STYLE" --show dmenu --prompt "Type password here.")
    nmcli device wifi connect "$ssid" password "$pass" || nmcli device wifi connect "$ssid"
  fi
  #!/usr/bin/env bash

  # Use nmcli to get a list of available wifi connections
  wifi_list=$(nmcli device wifi list)

  # Use wofi to display the list of wifi connections and allow the user to select one
  selected_wifi=$(echo "$wifi_list" | wofi --show dmenu)

  # Extract the wifi connection name and password from the selected wifi
  wifi_name=$(echo "$selected_wifi" | awk '{print $2}')
  wifi_password=$(echo "$selected_wifi" | awk '{print $8}')

  # If the wifi doesn't have a password, prompt the user to enter one
  if [ -z "$wifi_password" ]; then
    wifi_password=$(echo -n "Enter password for $wifi_name: " | wofi --dmenu)
  fi

  # Use nmcli to connect to the selected wifi
  nmcli device wifi connect "$wifi_name" password "$wifi_password"

  wifi_list=$(nmcli --terse --fields SSID,SECURITY dev wifi)

# Show wifi list with wofi
wifi_name=$(echo "$wifi_list" | wofi -d --show dmenu -p "Select wifi:")

# Connect to selected wifi
if [ -n "$wifi_name" ]; then
    # Connect to wifi
    nmcli -a connect "$wifi_name"

    # Show password input dialog if wifi requires password
    if [ -z "$wifi_password" ]; then
        wifi_password=$(echo "Enter password for $wifi_name:" | wofi -p "Wifi Password:")
        nmcli connection modify "$wifi_name" wifi-sec.psk "$wifi_password"
    fi
fi

# }



# if [[ -z "$(pidof wofi)" ]];then
#   connect
# else
#   killall wofi
# fi

