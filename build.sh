#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update and upgrade system packages
echo "Updating and upgrading system packages..."
sudo apt update && sudo apt upgrade -y

# Install necessary packages
echo "Installing required packages..."
sudo apt install -y python3 python3-venv python3-pip

# Create and activate virtual environment
echo "Setting up Python virtual environment..."
python3 -m venv .venv

# Activate the virtual environment
echo "Activating virtual environment..."
source .venv/bin/activate

# Install dependencies
if [ -f "requirements.txt" ]; then
  echo "Installing dependencies from requirements.txt..."
  pip install -r requirements.txt
else
  echo "requirements.txt not found. Skipping pip install."
fi

echo "Setup complete!"
