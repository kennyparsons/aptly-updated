#!/bin/bash

apt update &> /dev/null
apt list --upgradable

read -p "Do you accept all upgrades? (y/n): " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    apt upgrade -y
    apt install linux-headers-"$(uname -r)" -y
    apt autoremove
else
    exit 0
fi
