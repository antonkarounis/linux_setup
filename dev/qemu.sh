#!/bin/bash
set -e

#install vm packages
sudo apt install -y qemu-kvm libvirt-daemon  bridge-utils virtinst libvirt-daemon-system
