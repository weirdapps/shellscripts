#!/bin/bash

# Backup reminder
echo "Make sure you've backed up your data before running this script!"
read -p "Press enter to continue..."

# Update macOS
echo "Updating macOS..."
softwareupdate -l
#softwareupdate -ia

# Clean up cache files
echo "Cleaning up cache files..."
sudo rm -rf ~/Library/Caches/*
sudo rm -rf /Library/Caches/*

# Remove temporary files
echo "Removing temporary files..."
sudo rm -rf /private/var/tmp/*

# Clean up logs
echo "Cleaning up logs..."
sudo rm -rf /private/var/log/*

# Empty the trash
echo "Emptying the trash..."
sudo rm -rf ~/.Trash/*

# Update Homebrew
if command -v brew &> /dev/null; then
    echo "Updating Homebrew..."
    brew update
    brew upgrade
    brew cleanup
fi

# Run maintenance scripts
echo "Running maintenance scripts..."
sudo periodic daily
sudo periodic weekly
sudo periodic monthly

# Reindex Spotlight
echo "Reindexing Spotlight..."
sudo mdutil -E /

echo "Maintenance complete!"
