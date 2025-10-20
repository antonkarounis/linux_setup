#!/bin/bash
set -e

#sops install

curl -LO https://github.com/getsops/sops/releases/download/v3.11.0/sops-v3.11.0.linux.amd64

sudo mv sops-v3.11.0.linux.amd64 /usr/local/bin/sops

sudo chmod +x /usr/local/bin/sops

#age install

sudo apt install age
