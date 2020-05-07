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

function generate_sshkey {
    ssh-keygen -t rsa -N "" -f ssh.key
    mv ssh* ~/.ssh/
}

function append_once {
    LINE=$1
    FILE=$2
    grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
}

function install_conky {
    apt_install conky

    mkdir -p ~/.config/conky/
    wget -O ~/.config/conky/config.conf https://raw.githubusercontent.com/nullfocus/linux_setup/master/conky.conf 

    mkdir -p ~/.config/autostart/
    wget -O ~/.config/autostart/conky.desktop https://raw.githubusercontent.com/nullfocus/linux_setup/master/conky.desktop 
}

function install_neofetch {
    apt_install neofetch

    append_once "neofetch" ~/.bashrc

    mkdir -p ~/.config/neofetch/
    wget -O ~/config/neofetch/neofetch.conf https://raw.githubusercontent.com/nullfocus/linux_setup/master/neofetch.conf
}


#system tools
apt_install tlp tlp-rdw
apt_install net-tools
apt_install curl

#cool linux stuff
install_conky
install_neofetch
#common apps
install_chrome
apt_install vlc

#coding tools
apt_install git
git config --global user.email "nullfocus@gmail.com"
git config --global user.name "Antony Karounis"

snap_install code
snap_install beekeeper-studio

#languages and frameworks
apt_install python3
apt_install python3-pip
install_npm
install_java8
install_clojure

#for github
generate_sshkey

#snap_install postman
#snap_install termius-app

#set up some aliases and kick off neofetch
append_once "alias python=python3" ~/.bashrc
append_once "alias pip=pip3" ~/.bashrc

#gnome settings
gsettings set org.gnome.desktop.background picture-uri ''
gsettings set org.gnome.desktop.background primary-color 'rgb(5, 5, 5)'
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.interface clock-format 12h
gsettings set org.gnome.desktop.interface clock-show-weekday true
