#!/usr/bin/env bash

set -e

CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.config.bak"
SRC_DIR="$(pwd)/config"
mkdir -p "$CONFIG_DIR"
mkdir -p "$BACKUP_DIR"

# Symlink .zshrc
ln -sf "$(pwd)/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$(pwd)/zsh/pokemon-go-colorscripts" "$HOME/pokemon-go-colorscripts"

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

# Install apps

# Fonts
if [ ! -d "$HOME/.local/share/fonts/JetBrainsMonoNerd" ]; then
    rm -f JetBrainsMono.zip
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
    mkdir -p ~/.local/share/fonts/JetBrainsMonoNerd
    unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMonoNerd
    rm JetBrainsMono.zip
else
    echo "JetBrainsMono already installed"
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh my zsh not found. Installing..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
else
    echo "Oh my zsh already installed"
fi
