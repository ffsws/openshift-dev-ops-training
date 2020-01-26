#!/bin/bash

# System Update
yum -y update

# Install dependencies
yum -y install rng-tools yum-utils device-mapper-persistent-data lvm2 kernel-devel nano

# Install Additional Repositories
yum -y install epel-release
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum-config-manager --add-repo http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo

# Install Virtualbox
yum -y groupinstall "Development Tools"
yum -y install dkms VirtualBox-6.1

# Install Docker CE
yum -y install docker-ce

# Add default user to group
gpasswd -a centos docker
gpasswd -a centos vboxusers

# Enable services
systemctl enable rngd docker dkms

# Install docker compose
curl -L https://github.com/docker/compose/releases/download/1.25.3/docker-compose-`uname -s`-`uname -m` -o /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose

# Install docker machine
curl -L https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-`uname -s`-`uname -m` -o /usr/bin/docker-machine
chmod +x /usr/bin/docker-machine

# Create user SSH key
ssh-keygen -t rsa -b 4096 -N '' -C '' -f "/home/centos/.ssh/id_rsa"
chown -R centos:centos "/home/centos/.ssh"

reboot