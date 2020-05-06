#!/bin/bash
echo linux setup script

function apt_install {
    echo ""
    echo "Checking $1..."
    dpkg -s $1 &> /dev/null

    if [ $? -eq 0 ]; then
        echo "Package $1 is already installed!"
    else
        echo "Installing package $1"

        sudo apt-get --yes --force-yes install $1
    fi
}

function snap_install {
    echo ""
    echo "Checking $1..."
    snap list $1 &> /dev/null

    if [ $? -eq 0 ]; then
        echo "Package $1 is already installed!"
    else
        echo "Installing package $1"
        sudo snap install --classic $1
    fi
}

function wget_dpkg {
    echo ""
    echo "Checking $1..."

    dpkg -s $1 &> /dev/null

    if [ $? -eq 0 ]; then
        echo "Package $1 is already installed!"

    else
        filename=$(echo $2 | grep -oE "[^/]+$")

        echo "Downloading $filename"

        wget $2

        echo "Installing $filename"

        sudo dpkg -i "./$filename"
    fi
}

function install_chrome {
    wget_dpkg google-chrome-stable https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
}

function install_guitar {
    wget_dpkg google-chrome-stable https://files.soramimi.jp/guitar/1.1.1/guitar_1.1.1_amd64.deb
}

function install_npm {
    curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
    sudo apt-get install -y nodejs
}

function install_java8 {
    curl -sL https://raw.githubusercontent.com/serverfarmer/sf-java8/master/setup.sh | sudo -E bash -
}

function install_clojure {
    curl -O https://download.clojure.org/install/linux-install-1.10.1.536.sh
    chmod +x linux-install-1.10.1.536.sh
    sudo ./linux-install-1.10.1.536.sh
    
    sudo apt install rlwrap
}

function append_once {
    LINE=$1
    FILE=$2
    grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
}

apt_install curl
install_chrome
apt_install git
install_guitar
apt_install python3
apt_install python3-pip
install_npm
install_java8
install_clojure

snap_install code
snap_install postman
snap_install termius-app
apt_install vlc
apt_install conky
apt_install neofetch

ssh-keygen -t rsa -N "" -f ssh.key

append_once "alias python=python3" ~/.bashrc
append_once "alias pip=pip3" ~/.bashrc
append_once "neofetch" ~/.bashrc

gsettings set org.gnome.desktop.background picture-uri ''
gsettings set org.gnome.desktop.background primary-color 'rgb(66, 81, 100)'
gsettings set org.gnome.desktop.screensaver lock-enabled false

wget -O .conkyrc https://raw.githubusercontent.com/nullfocus/linux_setup/master/conky.conf 
mkdir -p ~/.config/neofetch/
wget -O ~/config/neofetch/neofetch.conf https://raw.githubusercontent.com/nullfocus/linux_setup/master/neofetch.conf
