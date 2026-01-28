#!/bin/bash
set -e

# source: https://code.visualstudio.com/docs/setup/linux#_install-vs-code-on-linux

sudo apt install -y wget curl ca-certificates

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg

sudo apt update
sudo apt install -y code

# Disable GitHub Copilot completely
code --uninstall-extension GitHub.copilot 2>/dev/null || true
code --uninstall-extension GitHub.copilot-chat 2>/dev/null || true

# Disable Copilot via settings
mkdir -p ~/.config/Code/User
cat > ~/.config/Code/User/settings.json << 'EOF'
{
    "chat.disableAIFeatures": true
}
EOF
