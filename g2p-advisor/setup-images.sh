#!/bin/bash
# Run this once to copy logo images into the theme's img directory.
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
IMG_DIR="$SCRIPT_DIR/login/resources/img"
LOGOS_DIR="$SCRIPT_DIR/logos"

mkdir -p "$IMG_DIR"

cp "$LOGOS_DIR/openg2p-favicon-for-dark-background.png" "$IMG_DIR/logo-mark.png"
cp "$LOGOS_DIR/openg2p-logo-for-dark-background.png"    "$IMG_DIR/openg2p-logo.png"
cp "$LOGOS_DIR/login-page-graphics.png"                  "$IMG_DIR/login-page-graphics.png"

echo "✅ Images copied to $IMG_DIR"
