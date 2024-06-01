#!/bin/sh

# A dwm_bar function to show the current network connection/SSID, private IP, and public IP using NetworkManager
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: NetworkManager, curl


dwm_networkmanager () {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "[ 󰖩 ]";;
	down) printf "[ 󰤮 ]";;
	esac
}


dwm_networkmanager
