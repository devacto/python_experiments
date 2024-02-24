#!/bin/bash

# Usage
# sh unzip_multipart.sh multipart/zip/path

# Stop if we encounter failure
set -euo pipefail

# Display the command as we run it.
set -x

MULTIPART_ZIP_PATH=$1

# Get the directory of the multipart zip.
MULTIPART_ZIP_DIR=$(dirname "$MULTIPART_ZIP_PATH")

# Combine multipart zip into a single zip.
MULTIPART_ZIP_FILENAME="${MULTIPART_ZIP_PATH##*/}"
MULTIPART_ZIP_FILENAME_WITHOUT_EXTENSION=${MULTIPART_ZIP_FILENAME%.*}
cd $MULTIPART_ZIP_DIR
zip -FF $MULTIPART_ZIP_FILENAME --out "$MULTIPART_ZIP_FILENAME_WITHOUT_EXTENSION-combined.zip"

# Unzip the resulting single zip.
unzip "$MULTIPART_ZIP_FILENAME_WITHOUT_EXTENSION-combined.zip" -d "$MULTIPART_ZIP_FILENAME_WITHOUT_EXTENSION-combined"
