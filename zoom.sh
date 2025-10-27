#!/bin/bash
set -e

sudo apt install gdebi

curl -o zoom_amd64.deb -L https://cdn.zoom.us/prod/6.6.6.5306/zoom_amd64.deb

sudo apt install -y ./zoom_amd64.deb

rm zoom_amd64.deb