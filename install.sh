#!/usr/bin/env bash

set -e

CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.config.bak"
SRC_DIR="$(pwd)/config"
mkdir -p "$CONFIG_DIR"
mkdir -p "$BACKUP_DIR"

for ITEM in "$SRC_DIR"/* "$SRC_DIR"/.[!.]* "$SRC_DIR"/..?*; do
    BASENAME="$(basename "$ITEM")"
    [ ! -e "$ITEM" ] && continue

    # Skip unwanted files/folders
    [[ "$BASENAME" == "nixos" ]] && continue
    [[ "$BASENAME" == ".git" ]] && continue
    [[ "$BASENAME" == "README.md" ]] && continue

    TARGET="$CONFIG_DIR/$BASENAME"
    BACKUP="$BACKUP_DIR/$BASENAME"

    # If target exists, move it to backup
    if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
        echo "Backing up $TARGET to $BACKUP"
        mv "$TARGET" "$BACKUP"
    fi

    # Symlink to ~/.config
    ln -s "$ITEM" "$TARGET"
    echo "Symlinked $BASENAME -> $TARGET"
done
