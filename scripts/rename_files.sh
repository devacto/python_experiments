#!/bin/bash

## Usage
# sh rename_files.sh /path/to/directory string_to_replace replacement_string

set -euo pipefail

set -x

DIRECTORY_PATH=$1

STRING_TO_REPLACE=$2

REPLACEMENT_STRING=$3

for filename in $DIRECTORY_PATH/*; do
    base=${filename##*/}                      # Extract basename ignoring path
    ext=${base##*.}                          # Get extension part
    name=${base%.*}                          # Remove extension leaving only the stem
    renamed="$(echo $name | sed s/$STRING_TO_REPLACE/$REPLACEMENT_STRING/)"       # Replace oldstring with newstring via Sed
    fullname="$renamed.$ext"                 # Combine modified stem & preserved extension
    echo "Renaming \"${filename}\" -> \"${fullname}\""         # Display what will happen
    mv "${filename}" "$DIRECTORY_PATH/${fullname}"     # Actual move when satisfied
done
