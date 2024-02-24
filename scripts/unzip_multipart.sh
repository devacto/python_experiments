#!/bin/bash

# Usage
# sh unzip_multipart.sh multipart/zip/path resulting/directory/path

# Stop if we encounter failure
set -euo pipefail

# Display the command as we run it.
set -x

MULTIPART_ZIP_PATH=$1
RESULTING_PATH=$2

# Combine multipart zip into a single zip.
zip -FF $MULTIPART_ZIP_PATH --out "$RESULTING_PATH.zip"

# Unzip the resulting single zip.
unzip $MULTIPART_ZIP_PATH -d "$RESULTING_PATH/"
