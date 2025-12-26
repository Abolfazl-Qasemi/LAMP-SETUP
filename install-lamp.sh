#!/bin/bash

cd /home/$USER/Desktop
source LAMP-setup/variable.sh


echo "This program install Apache , MariaDB-server and PHP, along with all configurations and date related to them that exist on your system!" 
read -p "Do you want to continue? [Y/n] " warningAllert
if [[ "$warningAllert" == "Y" ]]; then
    sleep 4
    echo "start process packages will installe"
    for package in "${allPackages[@]}"; do
        echo "---------------------------------------------------------"
        #package installed or not
        if [[ "$(dpkg -s $package | grep "Status" | cut -d ':' -f2)" != " install ok installed" ]]; then 
            sudo apt install $package -y &> 

        else
            echo $package" is installed before"
            beforeInstalled+=$package
            echo "$beforeInstalled"
        fi

    done 
    echo "$beforeInstalled"
    
else
    echo "good bye !"
fi


