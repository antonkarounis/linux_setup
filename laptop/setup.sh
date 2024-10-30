
sudo apt update
sudo apt upgrade


# ui tweaks

gsettings set org.gnome.desktop.background picture-uri ''
gsettings set org.gnome.desktop.background primary-color 'rgb(5, 5, 5)'
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.interface clock-format 12h
gsettings set org.gnome.desktop.interface clock-show-weekday true


# all dependencies here

sudo apt install -y curl wget tlp tlp-rdw net-tools vlc ca-certificates gnupg2 gpg apt-transport-https

# git

sudo apt install git
git config --global user.email "nullfocus@gmail.com" && git config --global user.name "Antony Karounis"

# 1password - https://support.1password.com/install-linux/#debian-or-ubuntu

wget https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb -P ~/Downloads/

sudo dpkg -i ~/Downloads/1password-latest.deb

# docker https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker


# vscode 
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install code

