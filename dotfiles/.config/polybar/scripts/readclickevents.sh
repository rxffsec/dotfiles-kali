#!/bin/bash

# Get workspace names and indices
workspaces=$(xprop -root _NET_DESKTOP_NAMES | awk -F ' = ' '{print $2}' | tr -d ',' | tr -d '"' | tr ' ' '\n')
index=1

# Loop through each workspace
for name in $workspaces; do
    echo "$index: $name"
    ((index++))
done

# Continuously read for clicks on workspace icons
while read -r line; do
    clicked_index=$(echo "$line" | awk '{print $1}')
    clicked_name=$(echo "$line" | awk '{$1=""; print $0}')

    # Execute your play.sh script or perform actions based on the clicked workspace
    $HOME/.config/polybar/hak/play.sh "$clicked_index" "$clicked_name" &
done

