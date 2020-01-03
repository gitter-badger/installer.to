#!/bin/sh

YUM_CMD=$(which yum) # yum package manager for RHEL & CentOS
DNF_CMD=$(which dnf) # dnf package manager for new RHEL & CentOS
APT_GET_CMD=$(which apt-get) # apt package manager for Ubuntu & other Debian based distributions
APK_CMD=$(which apk) # apk package manager for Alpine

 if [ ! -z $APT_GET_CMD ]; then
    if [  -n "$(uname -a | grep Ubuntu)" ]; then
        curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
        sudo apt-get install -y nodejs
    else
        curl -sL https://deb.nodesource.com/setup_12.x | bash -
        sudo apt-get install -y nodejs
    fi  
 elif [ ! -z $DNF_CMD ]; then
    sudo dnf install -y gcc-c++ make
    curl -sL https://rpm.nodesource.com/setup_12.x | sudo -E bash -
    sudo dnf install nodejs
 elif [ ! -z $YUM_CMD ]; then
    sudo yum install nodejs12
 elif [ 1 -z $APK_CMD ]; then
    sudo apk update
    sudo apk add nodejs
 else
    echo "Couldn't install package"
    exit 1;
 fi

node --version