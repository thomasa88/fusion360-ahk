#!/bin/bash

set -e

INKSCAPE=inkscape
if ! which $INKSCAPE &> /dev/null; then
    # Try to use Inkspace on Windows in Git Bash
    INKSCAPE='/c/Program Files/Inkscape/inkscape.exe'
fi

SVG=$1

if [[ -z $SVG ]]; then
    echo "Usage: $0 <svg>"
    exit 1
fi  

BASE=$(basename $SVG .svg)
PNG=images/${BASE}_16.png
PNG32=images/${BASE}_32.png
ICO=$BASE.ico

mkdir -p images

# Using Inkscape to convert to PNG
"$INKSCAPE" -z -w 16 -h 16 -e $PNG $SVG
"$INKSCAPE" -z -w 32 -h 32 -e $PNG32 $SVG

# Using ImageMagick to convert to ICO
# https://graphicdesign.stackexchange.com/a/77466/134698
# It's possible to stuff multiple PNG sizes into one ICO.
magick convert $PNG32 $PNG $ICO

# Keeping PNGs for README use
