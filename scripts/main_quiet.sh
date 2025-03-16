#!/bin/bash

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "Error: ImageMagick is required but not found. Please install it first."
    exit 1
fi

# Find and process all image files recursively
find . -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.gif" -o -iname "*.bmp" -o -iname "*.tiff" \) -exec sh -c '
    for file do
        convert "$file" -resize 1x1! "$file"
    done
' sh {} +

echo "All images have been resized to 1x1 pixels."
