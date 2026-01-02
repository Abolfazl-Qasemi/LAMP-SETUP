#!/bin/bash

cd /home/$USER/Desktop
source LAMP-setup/variable.sh



echo "This program remove Apache , MariaDB-server and PHP, along with all configurations and date related to them that exist on your system!" 
read -p "Do you want to continue? [Y/n] " warningAllert
if [[ "$warningAllert" == "Y" ]]; then
    echo -e "\e[36mif you see database page for remve, just enter yes\e[0m"
    sleep 4
    echo "start process..."
    for package in "${allPackages[@]}"; do
        echo "---------------------------------------------------------"
        #package installed or not
        if [[ "$(dpkg -s $package | grep "Status" | cut -d ':' -f2)" == " install ok installed" ]]; then 
            echo $package" will removed"
            sudo apt purge $package -y
        else
            echo "$package is not installed so we skiped "
        fi

    done 
    echo "autoremove and autoclean ..."
    sleep 2
    sudo apt autoremove -y
    sudo apt autoclean -y
    sudo rm -rf /etc/php
    sudo rm -rf /var/lib/php
else
    echo "good bye !"
fi











