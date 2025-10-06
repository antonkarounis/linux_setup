#!/bin/bash
set -e

echo "Fetching latest Go version..."
GO_VERSION=$(curl -s https://go.dev/VERSION?m=text | head -n1)

if [ -z "$GO_VERSION" ]; then
    echo "Error: Failed to fetch Go version"
    exit 1
fi

echo "Latest Go version: $GO_VERSION"

# Download Go
echo "Downloading $GO_VERSION..."
wget "https://go.dev/dl/${GO_VERSION}.linux-amd64.tar.gz"

# Remove existing Go installation if present
if [ -d "/usr/local/go" ]; then
    echo "Removing existing Go installation..."
    sudo rm -rf /usr/local/go
fi

# Extract to /usr/local
echo "Extracting to /usr/local..."
sudo tar -C /usr/local -xzf "${GO_VERSION}.linux-amd64.tar.gz"

# Clean up downloaded archive
rm "${GO_VERSION}.linux-amd64.tar.gz"

# Add to .bashrc if not already present
if ! grep -q '/usr/local/go/bin' ~/.bashrc; then
    echo "Adding Go to PATH in ~/.bashrc..."
    echo '' >> ~/.bashrc
    echo '# Go' >> ~/.bashrc
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
    echo "Added to ~/.bashrc, run 'source ~/.bashrc' to update session"
    
else
    echo "Go path already exists in ~/.bashrc"
fi