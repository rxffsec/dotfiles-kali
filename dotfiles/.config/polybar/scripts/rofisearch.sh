#!/bin/bash

# Run rofi to get user input
input=$(rofi -dmenu -p " browse the web" -theme $HOME/.config/rofi/searchRofi.rasi)

# Check if input is empty (user pressed Esc or canceled)
if [[ -z "$input" ]]; then
    exit 0
fi

# Check if input follows the format x.y (e.g., chat.openai.com)
if [[ "$input" =~ ^([a-zA-Z0-9]+\.)+[a-zA-Z0-9]+$ ]]; then
    firefox --new-tab "https://$input" &>/dev/null 2>&1 & disown
else
    firefox --new-tab "https://www.google.com/search?q=$input" &>/dev/null 2>&1 & disown
fi

