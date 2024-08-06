#!/bin/sh

# Define your Icons with Polybar colors
VLC_ICON="%{F#FF7F00}󰕼 %{F-}"
FIREFOX_ICON="%{F#FF0000}󰈹 %{F-}"
CHROME_ICON="%{F#FFFF00} %{F-}"
EDGE_ICON="%{F#00FFFF} %{F-}"
SPOTIFY_ICON="%{F#1DB954} %{F-}"
MUSIC_ICON="%{F#FF00FF}󰌳 %{F-}"
# 
if [ "$(playerctl status 2> /dev/null)" = "Playing" ]; then
    PLAYER=$(playerctl metadata --format '{{playerName}}')
    ARTIST=$(playerctl metadata artist)
    TITLE=$(playerctl metadata title)

    # If either artist or title length is > 20, then cut and add ellipsis
    if [ "${#ARTIST}" -ge 21 ]; then
        ARTIST="$(printf '%s' "$ARTIST" | cut -c 1-20)..."
    fi

    if [ "${#TITLE}" -ge 21 ]; then
        TITLE="$(printf '%s' "$TITLE" | cut -c 1-20)..."
    fi

    case "$PLAYER" in
        "chromium") echo "$CHROME_ICON $ARTIST - $TITLE"
        ;;
        "edge") echo "$EDGE_ICON $ARTIST - $TITLE"
        ;;
        "vlc") echo "$VLC_ICON $ARTIST - $TITLE"
        ;;
        "spotify") echo "$SPOTIFY_ICON $ARTIST - $TITLE"
        ;;
        "firefox") echo "$FIREFOX_ICON $ARTIST - $TITLE"
        ;;
        "mpv") echo "$MUSIC_ICON $ARTIST - $TITLE"
        ;;
        *) echo "$MUSIC_ICON $ARTIST - $TITLE"
        ;;
    esac
else
    echo "Player is not running"
fi
