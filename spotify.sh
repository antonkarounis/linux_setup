#!/bin/bash
set -e

# source: https://www.spotify.com/de-en/download/linux/

curl -sS https://download.spotify.com/debian/pubkey_5384CE82BA52C83A.asc \
    | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg

echo "deb https://repository.spotify.com stable non-free" \
    | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt-get update
sudo apt-get install -y spotify-client 

# causing crashes when it was missing
sudo apt install libcups2t64