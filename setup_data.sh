#!/bin/bash
# setup_data.sh
# Downloads the required hadith database file from the original repository.
# Run this script after cloning the project to get the heavy data files.
#
# Usage: bash setup_data.sh

set -e

echo "============================================"
echo "  Al Quran v3 - Data Setup Script"
echo "============================================"
echo ""
echo "This script downloads the hadith database file (~166MB)"
echo "from the original repository."
echo ""

# Create directories
mkdir -p assets/databases

# Check if database already exists
if [ -f "assets/databases/hadith.ar-en.v2.db" ]; then
    echo "Database file already exists. Skipping download."
    echo "If you want to re-download, delete assets/databases/ and run again."
    exit 0
fi

echo "Downloading hadith database from original repository..."
echo ""

# Download from the original IsmailHosenIsmailJames/al_quran_v3 repository
TEMP_DIR=$(mktemp -d)
echo "Cloning to temporary directory (this may take a while)..."
git clone --depth 1 https://github.com/IsmailHosenIsmailJames/al_quran_v3.git "$TEMP_DIR" 2>&1 | tail -1

echo "Copying database files..."
if [ -d "$TEMP_DIR/assets/databases" ]; then
    cp -r "$TEMP_DIR/assets/databases/" assets/databases/
else
    echo "No databases found in the original repo."
fi

echo "Cleaning up..."
rm -rf "$TEMP_DIR"

echo ""
echo "============================================"
echo "  ✅ Data setup complete!"
echo "  Database downloaded to: assets/databases/"
echo "============================================"
echo ""
echo "You can now run: flutter pub get && flutter run"