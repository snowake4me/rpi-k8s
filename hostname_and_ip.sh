#!/bin/sh

hostname=$1
ip=$2 # should be of format: 10.10.10.201
dns=$3 # should be of format: 192.168.100.53
router=$4 # should be of format: 10.10.10.1

# Change the hostname
sudo hostnamectl --transient set-hostname $hostname
sudo hostnamectl --static set-hostname $hostname
sudo hostnamectl --pretty set-hostname $hostname
sudo sed -i s/raspberrypi/$hostname/g /etc/hosts

# Set the static ip

sudo cat <<EOT >> /etc/dhcpcd.conf
interface eth0
static ip_address=$ip/24
static routers=$router
static domain_name_servers=$dns
EOT