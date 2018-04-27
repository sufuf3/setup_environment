#!/bin/bash
# This script is pre setup scrpt.
# Please use root user

# set the enviroment
# Local: Set /etc/resolve.cfg
wget https://goo.gl/ojQzx5 -O pre_setup_resolve.conf
cp pre_setup_resolve.conf /etc/resolve.conf
# Maybe need to add the following lines, if the hosts use server version OS image
# echo "dns-nameservers 8.8.8.8,8.8.4.4" >> /etc/network/interface

# Network restart & install package
/etc/init.d/networking restart

UBUNTU_APT_SITE=free.nchc.org.tw
sed -i 's/^deb-src\ /\#deb-src\ /g' /etc/apt/sources.list
sed -E -i "s/([a-z]+.)?archive.ubuntu.com/$UBUNTU_APT_SITE/g" /etc/apt/sources.list
sed -i "s/security.ubuntu.com/$UBUNTU_APT_SITE/g" /etc/apt/sources.list

apt update
apt upgrade -y

# Timezone Set
TZ=Asia/Taipei
export DEBIAN_FRONTEND=noninteractive
apt-get install -y tzdata
dpkg-reconfigure --frontend noninteractive tzdata
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

apt install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
vim nmap iperf iperf3 tmux traceroute git sshpass curl openssh-server tree htop build-essential bash-completion python-pip python-dev build-essential python-setuptools python-numpy python-scipy python-matplotlib python-setuptools software-properties-common && \
apt clean

sed -i "s/PermitRootLogin no/PermitRootLogin yes/g" /etc/ssh/sshd_config
sed -i "s/PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
systemctl reload ssh.service
service ssh restart
chkconfig sshd on

sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt-get update
apt install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
python3.6 python3-pip python3-dev && \
apt clean

# Add user
PASSWORD=$1
if  [ -z $PASSWORD ]; then
    useradd -m opadmin -s /bin/bash && echo "opadmin:OPgreatW0rld" | chpasswd && passwd -u opadmin
    sshpass -p OPgreatW0rld ssh -o StrictHostKeyChecking=no opadmin@localhost "touch ~/.sudo_as_admin_successful"
    echo "root:OPgreatW0rld" | chpasswd && passwd -u root
else
    useradd -m opadmin -s /bin/bash && echo "opadmin:$PASSWORD" | chpasswd && passwd -u opadmin
    sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no opadmin@localhost "touch ~/.sudo_as_admin_successful"
    echo "root:$PASSWORD" | chpasswd && passwd -u root
fi

adduser opadmin sudo
adduser opadmin adm
adduser opadmin dip
adduser opadmin cdrom
adduser opadmin plugdev
adduser opadmin lxd
adduser opadmin lpadmin
adduser opadmin sambashare
echo "opadmin ALL=NOPASSWD: ALL" >> /etc/sudoers

rm -f pre_setup_resolve.conf

# Local: install Ansible
apt-add-repository ppa:ansible/ansible -y
apt-get update
apt-get install ansible -y

echo "Please download KaaS deploy tool"
