#!/bin/bash

# Move files from Downloads to Trash
find ~/Downloads/* -exec mv {} ~/.Trash \;

# Move files on the desktop to Trash
find ~/Desktop/* -maxdepth 0 -type f -exec mv {} ~/.Trash \;

# Empty the Trash
rm -rf ~/.Trash/*
