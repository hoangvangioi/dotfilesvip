#!/bin/sh

# Define directories and commands
DIR="$HOME/.config"
rofi_cmd="rofi -theme $DIR/rofi/themes/powermenu.rasi"

# Check for required commands
for cmd in rofi systemctl i3lock; do
    if ! command -v $cmd >/dev/null; then
        echo "$cmd is not installed. Please install it first."
        exit 1
    fi
done

# Get uptime
uptime=$(uptime -p | sed -e 's/up //g')

# Handle user choice
handle_choice() {
    ans=$(rofi -dmenu -i -no-fixed-num-lines -p "Are You Sure? : " -theme "$DIR"/rofi/themes/confirm.rasi)
    case "$ans" in
    y)
        eval "$1" || rofi -theme "$DIR"/rofi/themes/askpass.rasi -e "Failed to execute $1"
        ;;
    n)
        exit 0
        ;;
    *)
        rofi -theme "$DIR"/rofi/themes/askpass.rasi -e "Options  -  yes / y / no / n"
        ;;
    esac
}

# Define options
shutdown=""
reboot=""
hibernate="󰒲"
lock=""
suspend="󰤄"
logout="󰍃"

# Create menu options
options="$shutdown\n$reboot\n$hibernate\n$lock\n$suspend\n$logout"

# Show rofi menu and handle choices
chosen="$(printf "%b" "$options" | $rofi_cmd -p "UP - $uptime" -dmenu -selected-row 2)"
case $chosen in
"$shutdown")
    handle_choice "systemctl poweroff"
    ;;
"$reboot")
    handle_choice "systemctl reboot"
    ;;
"$hibernate")
    handle_choice "systemctl hibernate"
    ;;
"$lock")
    i3lock -i "$DIR/script/material-ocean.png" || rofi -theme "$DIR"/rofi/themes/askpass.rasi -e "Failed to lock screen"
    ;;
"$suspend")
    handle_choice "systemctl suspend"
    ;;
"$logout")
    handle_choice "i3-msg exit"
    ;;
*)
    rofi -theme "$DIR"/rofi/themes/askpass.rasi -e "Invalid option"
    ;;
esac

exit 0
