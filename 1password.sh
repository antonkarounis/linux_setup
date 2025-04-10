#!/bin/bash

sudo apt install gnupg2

# 1password - https://support.1password.com/install-linux/#debian-or-ubuntu

wget https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb -P ~/Downloads/

sudo dpkg -i ~/Downloads/1password-latest.deb