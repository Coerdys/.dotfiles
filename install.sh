#!/usr/bin/env bash

set -e

# Ensure ~/.config exists
CONFIG_DIR="$HOME/.config"
mkdir -p "$CONFIG_DIR"

# Loop through all files and directories in the current directory, except the script itself
for ITEM in * .*; do
    # Skip . and ..
    [[ "$ITEM" == "." || "$ITEM" == ".." ]] && continue
    # Skip the script itself, if running from the same folder
    [[ "$ITEM" == "${0##*/}" ]] && continue

    TARGET="$CONFIG_DIR/$ITEM"

    # Remove existing file/folder/symlink in ~/.config
    if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
        rm -rf "$TARGET"
    fi

    # Symlink to ~/.config
    ln -s "$(pwd)/$ITEM" "$TARGET"
    echo "Symlinked $ITEM -> $TARGET"
done
