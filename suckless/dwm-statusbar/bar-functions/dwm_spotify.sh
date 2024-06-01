#!/bin/sh

# A dwm_bar function that shows the current artist, track, duration, and status from Spotify using playerctl
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: spotify/spotifyd, playerctl

# NOTE: The official spotify client does not provide the track position or shuffle status through playerctl. This does work through spotifyd however.

dwm_spotify () {
    if ps -C spotify > /dev/null; then
        PLAYER="spotify"
    elif ps -C spotifyd > /dev/null; then
        PLAYER="spotifyd"
    fi

    if [ "$PLAYER" = "spotify" ] || [ "$PLAYER" = "spotifyd" ]; then
        ARTIST=$(playerctl --player=spotify metadata artist)
        TRACK=$(playerctl --player=spotify metadata title)
        POSITION=$(playerctl --player=spotify position | sed 's/..\{6\}$//')
        DURATION=$(playerctl --player=spotify metadata mpris:length | sed 's/.\{6\}$//')
        STATUS=$(playerctl --player=spotify status)
        SHUFFLE=$(playerctl --player=spotify shuffle)
	LOOP=$(playerctl --player=spotify loop)

        if [ "$IDENTIFIER" = "unicode" ]; then
            if [ "$STATUS" = "Playing" ]; then
                STATUS=" "
            else
                STATUS=" "
            fi
            
            if [ "$SHUFFLE" = "On" ]; then
                SHUFFLE="  "
            else
                SHUFFLE=""
            fi
"""
	    if [ "$LOOP" = "Track" ]; then
	    	LOOP=" 󰑘 "
	    elif [ "$LOOP" = "Playlist" ]; then
            	LOOP=" 󰑖 "
	    else
	    	LOOP=""
	    fi
"""	    
        fi
        
	if [ "$PLAYER" = "spotify" ]; then
        	printf "%s%s %s - %s " "$SEP1" "$STATUS" "$ARTIST" "$TRACK"
		printf "| "
        	printf "%0d:%02d/" $((POSITION%3600/60)) $((POSITION%60))
        	printf "%0d:%02d" $((DURATION%3600/60)) $((DURATION%60))
		printf "%s%s\n" "$SHUFFLE" "$SEP2"
	fi	
    fi
}

dwm_spotify
