#!/bin/bash
# This script is pre setup scrpt.
# Please use root user

# set the enviroment
# Local: Set /etc/resolve.cfg
wget https://goo.gl/hyR1vA -O pre_setup_resolve.conf
cp pre_setup_resolve.conf /etc/resolve.conf
# Maybe need to add the following lines, if the hosts use server version OS image
# echo "dns-nameservers 8.8.8.8,8.8.4.4" >> /etc/network/interface

# Network restart & install package
/etc/init.d/networking restart
apt update
apt upgrade -y && apt install vim tmux traceroute git sshpass curl -y

# Local: install Ansible
apt-get install software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install ansible -y

git clone https://sufuf3149@bitbucket.org/itri-opteam/auto-deploy-k8s.git && cd auto-deploy-k8s

echo "Please modify the files: set_env/hosts, auto-deploy.sh, inventory, group_vars/all.yml, according to README.md"
echo "After all, please execute the auto-deploy.sh script"
