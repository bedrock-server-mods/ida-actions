#!/usr/bin/env bash

set -ex

URL="https://minecraft.net/en-us/download/server/bedrock/"
DOWNLOAD=$(wget -q -O - "$URL" | grep -Eo "https://\S*/bin-linux/\S*" | sed -e 's/^"//' -e 's/"$//')
VERSION=$(echo "$DOWNLOAD" | grep -Eo "([0-9]+\.){3}[0-9]+")
OUTPUT="bedrock_server.zip"

echo "Found bedrock_server $VERSION"

wget -q "$DOWNLOAD" -O "$OUTPUT"
7z x "$OUTPUT"
