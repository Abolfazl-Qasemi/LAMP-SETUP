#!/bin/bash

cd /home/$USER/Desktop
source LAMP-setup/variable.sh


echo "This program install Apache , MariaDB-server and PHP, along with all configurations and date related to them that exist on your system!" 
read -p "Do you want to continue? [Y/n] " warningAllert
if [[ "$warningAllert" == "Y" ]]; then
    sleep 4
    if sudo apt update; then      
        echo "Start process..."
        for package in "${allPackages[@]}"; do
            echo "----------------------------------------------------"
            #package installed or not
            if [[ "$(dpkg -s $package | grep "Status" | cut -d ':' -f2)" != " install ok installed" ]]; then 
                sudo apt install $package -y
            fi

        done 
        #creat info.php file
        if [[ ! -e "/var/www/html/info.php" ]]; then
            sudo mkdir -p /var/www/html/
            #print code -> than write to info.php -> at the end paste to null for clean terminal 
            echo -e "<?php \nphpinfo(); \n?>" | sudo tee /var/www/html/info.php > /dev/null 

        fi
        sudo systemctl restart apache2
        fi
else
    echo "Bye"
fi


