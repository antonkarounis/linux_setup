
# new debian virtual server / hypervisor setup

#switch to root
su -l

#freshen up system
apt update
apt upgrade

#install required packages
apt install -y sudo wget

#add user to sudoers
adduser antonyk sudo

#install ssh
apt install -y openssh-server

#install vm packages
apt -y install qemu-kvm libvirt-daemon  bridge-utils virtinst libvirt-daemon-system
