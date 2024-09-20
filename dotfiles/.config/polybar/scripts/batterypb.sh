#!/bin/bash

battery_print() {
    PATH_AC="/sys/class/power_supply/AC"
    PATH_BATTERY_0="/sys/class/power_supply/BAT0"
    PATH_BATTERY_1="/sys/class/power_supply/BAT1"

    ac=0
    battery_level=0
    battery_max=0

    if [ -f "$PATH_AC/online" ]; then
        ac=$(cat "$PATH_AC/online")
    fi

    if [ -f "$PATH_BATTERY_0/energy_now" ] && [ -f "$PATH_BATTERY_0/energy_full" ]; then
        battery_level=$(( $(cat "$PATH_BATTERY_0/energy_now") + battery_level ))
        battery_max=$(( $(cat "$PATH_BATTERY_0/energy_full") + battery_max ))
    fi

    if [ -f "$PATH_BATTERY_1/energy_now" ] && [ -f "$PATH_BATTERY_1/energy_full" ]; then
        battery_level=$(( $(cat "$PATH_BATTERY_1/energy_now") + battery_level ))
        battery_max=$(( $(cat "$PATH_BATTERY_1/energy_full") + battery_max ))
    fi

    battery_percent=$(( (battery_level * 100) / battery_max ))

    if [ "$ac" -eq 1 ]; then
        icon="󰂄"

        if [ "$battery_percent" -gt 97 ]; then
            echo "$icon $battery_percent%"
        else
            echo "$icon $battery_percent%"
        fi
    else
        if [ "$battery_percent" -eq 100 ]; then
            icon="󰁹"
        elif [ "$battery_percent" -ge 90 ]; then
            icon="󰂂"
        elif [ "$battery_percent" -ge 80 ]; then
            icon="󰂁"
        elif [ "$battery_percent" -ge 70 ]; then
            icon="󰂀"
        elif [ "$battery_percent" -ge 60 ]; then
            icon="󰁿"
        elif [ "$battery_percent" -ge 50 ]; then
            icon="󰁾"
        elif [ "$battery_percent" -ge 40 ]; then
            icon="󰁽"
        elif [ "$battery_percent" -ge 30 ]; then
            icon="󰁼"
        elif [ "$battery_percent" -ge 20 ]; then
            icon="!󰁻"
        elif [ "$battery_percent" -ge 10 ]; then
            icon="!!󰁺"
        else
            icon=" !!!󰁺"
        fi

        echo "$icon $battery_percent%"
    fi
}

path_pid="/tmp/polybar-battery-combined-udev.pid"

case "$1" in
    --update)
        pid=$(cat "$path_pid")

        if [ -n "$pid" ]; then
            kill -10 "$pid"
        fi
        ;;
    *)
        echo "$$" > "$path_pid"

        trap exit INT
        trap "echo" USR1

        while true; do
            battery_print

            sleep 1 &
            wait
        done
        ;;
esac

