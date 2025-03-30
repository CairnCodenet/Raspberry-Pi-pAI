#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update and upgrade system packages
echo "Updating and upgrading system packages..."
sudo apt update && sudo apt upgrade -y

# Install necessary packages
echo "Installing required packages..."
sudo apt install -y python3 python3-venv python3-pip gcc

# Go install
echo "Installing Go"
wget https://go.dev/dl/go1.24.1.linux-arm64.tar.gz && sudo tar -C /usr/local -xzf go1.24.1.linux-arm64.tar.gz
export PATH=$PATH:/usr/local/go/bin
sudo rm -rf go1.21.1.linux-arm64.tar.gz

# Lazygit install
echo "Installing Lazygit"
git clone https://github.com/jesseduffield/lazygit.git
cd lazygit
go build -o lazygit
sudo mv lazygit /usr/local/bin/
cd ..
rm -rf lazygit/

# Create and activate virtual environment
echo "Setting up Python virtual environment..."
python3 -m venv .venv

# Activate the virtual environment
echo "Activating virtual environment..."
source .venv/bin/activate

# Install dependencies wq
if [ -f "requirements.txt" ]; then
  echo "Installing dependencies from requirements.txt..."
  pip install -r requirements.txt
else
  echo "requirements.txt not found. Skipping pip install."
fi

echo "Setup complete!"
