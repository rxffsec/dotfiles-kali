#!/bin/bash

# Set your command/script here
command_to_execute="$HOME/.config/polybar/hak/scripts/play.sh"

# Define the top-left corner area
top_left_width=50
top_left_height=50

while true; do
    # Get mouse position
    eval $(xdotool getmouselocation --shell)

    # Check if mouse is within the top-left corner area
    if [ $X -le $top_left_width ] && [ $Y -le $top_left_height ]; then
        # Execute your command/script when in the top-left corner
        $command_to_execute
    fi

    # Adjust the sleep duration based on your desired responsiveness
    sleep 0.1
done

