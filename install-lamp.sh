#!/bin/bash

cd /home/$USER/Desktop
source LAMP-setup/variable.sh


echo "This program install Apache , MariaDB-server and PHP, along with all configurations and date related to them that exist on your system!" 
read -p "Do you want to continue? [Y/n] " warningAllert
if [[ "$warningAllert" == "Y" ]]; then
    sleep 4
    echo "Start process packages will installe "
    for package in "${allPackages[@]}"; do
        echo "---------------------------------------------------------"
        #package installed or not
        if [[ "$(dpkg -s $package | grep "Status" | cut -d ':' -f2)" != " install ok installed" ]]; then 
            sudo apt install $package -y
        else
            echo -e "\e[36m$package is installed before\e[0m"
            beforeInstalled+=$package
            echo "$beforeInstalled"
        fi

    done 
    sudo systemctl restart apache2
    for package in "${allPackages[@]}"; do

        if [[ "$(dpkg -s $package | grep "Status" | cut -d ':' -f2)" != " install ok installed" ]]; then
                    echo -e "\e[31mERROR: $package package dose not install\e[0m"
        else
                    echo -e "\e[32m$package package installed\e[0m"
        fi
    done
    
else
    echo "Bye"
fi


