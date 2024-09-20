#!/usr/bin/env bash

# File to store the target value
TARGET_FILE="$HOME/.config/polybar/target.txt"

# Function to manage the target
manage_target() {
  local target="no target"
  
  case "$1" in
    -c|--clear)
      echo "[x] no target" > "$TARGET_FILE"
      ;;
    *)
      if [ -n "$1" ]; then
        target="$@"
        echo "[+] $target" > "$TARGET_FILE"
      else
        if [ -f "$TARGET_FILE" ]; then
          target=$(cat "$TARGET_FILE")
        fi
      fi
      echo "$target"
      ;;
  esac
}

# Call the function with passed arguments
manage_target "$@"

