#!/bin/bash
set -e

# Clean up any existing debian.griffo.io repository setup
echo "Cleaning up debian.griffo.io repository setup..."
sudo rm -f /etc/apt/trusted.gpg.d/debian.griffo.io.gpg
sudo rm -f /etc/apt/sources.list.d/debian.griffo.io.list
echo "Repository cleanup completed."

curl -LsSf https://astral.sh/uv/install.sh | sh

# Add UV to PATH if not already there
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    export PATH="$HOME/.local/bin:$PATH"
fi