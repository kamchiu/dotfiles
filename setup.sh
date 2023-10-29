#!/bin/bash

# Dotfiles directory
DOTFILES_DIR="$HOME/dotfiles"

# List of dotfiles to symlink
DOTFILES=(
  .bashrc
  .vimrc
  .gitconfig
)

# Function to create symbolic links
create_symlinks() {
  for dotfile in "${DOTFILES[@]}"; do
    # Backup existing dotfile if it exists
    if [ -e "$HOME/$dotfile" ]; then
      echo "Backing up existing $dotfile to $HOME/$dotfile.bak"
      mv "$HOME/$dotfile" "$HOME/$dotfile.bak"
    fi

    # Create symbolic link
    echo "Creating symlink for $dotfile"
    ln -s "$DOTFILES_DIR/$dotfile" "$HOME/$dotfile"
  done
}

# Run the setup
echo "Setting up dotfiles..."
create_symlinks
echo "Dotfiles setup complete!"

