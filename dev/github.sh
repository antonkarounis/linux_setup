#!/bin/bash
set -e

sudo apt install -y git

# in 1password now
# ssh-keygen -t ed25519 -C "nullfocus@gmail.com"  -N "" -f ~/.ssh/github.key
# eval "$(ssh-agent -s)"
# sh-add ~/.ssh/github.key

git config --global user.email "nullfocus@gmail.com"
git config --global user.name "Antony Karounis"
