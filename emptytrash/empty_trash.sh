#!/bin/zsh

# Get the current user's ID
USER_ID=$(id -u)

# Move files from Downloads to Trash
mv ~/Downloads/* ~/.Trash/ 2>/dev/null

# Move files on the desktop to Trash
mv ~/Desktop/* ~/.Trash/ 2>/dev/null

# Disable zsh's rm prompt temporarily
if [ "$SHELL" = "/bin/zsh" ] || [ "$SHELL" = "/usr/bin/zsh" ]; then
    UNSET_ZSH_OPTS=true
    unsetopt RM_STAR_SILENT
fi

# Empty the Trash on the boot volume
rm -rf ~/.Trash/*

# Empty the Trash on other volumes
sudo rm -rf /.Trashes/$USER_ID/*

# Re-enable zsh's rm prompt if it was unset before
if [ "$UNSET_ZSH_OPTS" = "true" ]; then
    setopt RM_STAR_SILENT
fi
