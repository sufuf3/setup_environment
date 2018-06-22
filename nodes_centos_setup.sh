#!/bin/bash
# This script is pre setup scrpt.
# Please use root user
# sh nodes_setup.sh <opadmin's password>

# set the enviroment
# Local: Set /etc/resolve.cfg
curl https://goo.gl/ojQzx5 -Lo ~/pre_setup_resolve.conf
cp pre_setup_resolve.conf /etc/resolve.conf

yum update -y
yum upgrade -y
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

# Timezone Set
#TZ=Asia/Taipei
#export DEBIAN_FRONTEND=noninteractive
#yum install -y tzdata
#dpkg-reconfigure --frontend noninteractive tzdata
#ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
timedatectl set-timezone Asia/Taipei

yum install vim nmap iperf wget iperf3 tmux traceroute git sshpass curl openssh-server tree htop build-essential bash-completion python-pip python-dev build-essential python-setuptools -y
# Default root can ssh
#sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
#sed -i "s/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g" /etc/ssh/sshd_config
#sed -i "s/#PermitRootLogin no/PermitRootLogin yes/g" /etc/ssh/sshd_config
#sed -i "s/#PermitRootLogin yes/PermitRootLogin yes/g" /etc/ssh/sshd_config
#sed -i "s/PermitRootLogin no/PermitRootLogin yes/g" /etc/ssh/sshd_config
#sed -i "s/PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
#systemctl reload ssh.service
#systemctl restart sshd.service
#systemctl status sshd.service

cd ~/ && yum -y install https://centos7.iuscommunity.org/ius-release.rpm
yum -y install python36u python36u-pip python36u-devel
iptables -F

# Add user
#PASSWORD=$1
#if  [ -z $PASSWORD ]; then
#    useradd -m opadmin -s /bin/bash && echo "opadmin:OPgreatW0rld" | chpasswd && passwd -u opadmin
#    sshpass -p OPgreatW0rld ssh -o StrictHostKeyChecking=no opadmin@localhost "touch ~/.sudo_as_admin_successful"
#    echo "root:OPgreatW0rld" | chpasswd && passwd -u root
#else
#    useradd -m opadmin -s /bin/bash && echo "opadmin:$PASSWORD" | chpasswd && passwd -u opadmin
#    sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no opadmin@localhost "touch ~/.sudo_as_admin_successful"
#    echo "root:$PASSWORD" | chpasswd && passwd -u root
#fi
#adduser opadmin sudo
#adduser opadmin adm
#adduser opadmin dip
#adduser opadmin cdrom
#adduser opadmin plugdev
#adduser opadmin lxd
#adduser opadmin lpadmin
#adduser opadmin sambashare
#echo "opadmin ALL=NOPASSWD: ALL" >> /etc/sudoers

rm ~/pre_setup_resolve.conf

echo "Setup finish!"
