#This script performs daily maintenance tasks on a Linux system. It should be ran every day!!!!
#!/bin/bash
# Daily Linux system maintenance script

set -e  # Exit on error
trap 'echo "Script failed at line $LINENO"' ERR

echo "=== Starting Daily System Upkeep ==="
echo "Date: $(date)"

# Update package database
echo "Updating package lists..."
sudo apt update

# Upgrade packages
echo "Upgrading packages..."
sudo apt upgrade -y

# Clean up
echo "Cleaning up..."
sudo apt autoremove -y
sudo apt autoclean

# Check disk space
echo "Disk usage:"
df -h / | tail -1

echo "=== Daily upkeep completed successfully! ==="