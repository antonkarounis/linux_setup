#!/bin/bash
set -e

sudo apt install -y tlp tlp-rdw thermald \
                 powertoptp-smapi-dkms i7z \
                 acpi-call-dkms s-tui stress


sudo systemctl enable --now tlp
sudo systemctl start thermald
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket  # Prevent conflicts with tlp