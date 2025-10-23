#!/bin/bash

# Screenshot script using grim, slurp, and swappy
# Takes a screenshot of a selected area, saves it with a timestamp, and opens it in swappy

# Set the screenshot directory
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"

# Create the directory if it doesn't exist
mkdir -p "$SCREENSHOT_DIR"

# Generate timestamp (format: YYYY-MM-DD_HH-MM-SS)
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Set the filename with path
FILENAME="$SCREENSHOT_DIR/screenshot_$TIMESTAMP.png"

# Use slurp to select area, grim to capture it, and save to file
grim -g "$(slurp)" "$FILENAME"

# Check if screenshot was taken successfully
if [ $? -eq 0 ]; then
    echo "Screenshot saved to: $FILENAME"
    
    # Open the screenshot in swappy for editing
    swappy -f "$FILENAME"
else
    echo "Screenshot cancelled or failed"
    exit 1
fi
