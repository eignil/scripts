#!/usr/bin/env bash
#Create a new user for system
#

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

# Make sure only root can run our script
[[ $EUID -ne 0 ]] && echo -e "[${red}Error${plain}] This script must be run as root!" && exit 1



# Set  username
echo "Please input username :"
read -p "(Default username: username):" username
[ -z "${username}" ] && username="username"
echo
echo "---------------------------"
echo "username = ${username}"
echo "---------------------------"
echo

# Set  password
#echo "Please input password :"
#read -p "(Default password: afBiae.3W):" password
#[ -z "${password}" ] && password="afBiae.3W"
#echo
#echo "---------------------------"
#echo "password = ${password}"
#echo "---------------------------"
#echo

useradd -d /home/${username} -s /bin/bash ${username}

if [ $? -ne 0 ]; then
    echo "Add new user ${username} failed!"
    exit 1
fi

echo "Set password:"
passwd ${username}

if [ $? -ne 0 ]; then
    echo "Set password for user ${username} failed!"
    exit 1
fi

echo "Add new user ${username} success!"

