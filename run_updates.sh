#!/bin/bash


# require superuser
# https://askubuntu.com/a/748362
# [ "$UID" -eq 0 ] || { echo "This script must be run as root."; exit 1;}

# run apt updates
if command -v apt-get &> /dev/null ; then
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt-get dist-upgrade -y
	sudo apt-get autoremove
	sudo apt-get autoclean
fi

if command -v pacman &> /dev/null ; then
	sudo pacman -Syu
fi

# other updates
if command -v snap &> /dev/null ; then
    sudo snap refresh
fi

if command -v brew &> /dev/null ; then
    brew upgrade
fi

if command -v npm &> /dev/null ; then
    npm update
fi

if command -v pveam &> /dev/null ; then
    pveam update
fi
