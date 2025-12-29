#!/bin/bash

cd /home/$USER/Desktop
source LAMP-setup/variable.sh

#test apache2 and mariadb
for package in "${packagesServices[@]}"; do 
    if [[ "$(systemctl status $package | head -3 | tail -1 | cut -d " " -f6,7,8)" != "Active: active (running)" ]]; then
    echo -e "\e[31m There is a problem with the $package \e[0m"
    problemTest=1
fi
done

#test installed or not
for package in "${allPackages[@]}"; do
    if [[ "$(dpkg -s $package | grep "Status" | cut -d ':' -f2 )" != " install ok installed" ]]; then 
        echo -e "\e[31m There is no $package \e[0m"
        problemTest=1
    fi
done

#test info.php
if [[ "$(cat /var/www/html/info.php)" != "<?php \nphpinfo();\n?>" ]]; then
    echo -e "\e[31m There is no standard info.php file \e[0m"
    problemTest=1
fi 

#port test
if [[ "$(sudo ss -unlpt | grep :80 | cut -d "(" -f3 | cut -d '"' -f2)" != "apache2"]]; then
    echo -e "\e[31m Port error\e[0m"
    problemTest=1
fi

#test database
if [[ "$(sudo mariadb -u root -p )" != "Enter password:" ]]; then
    echo -e "\e[31m date base error\e[0m"
    problemTest=1
fi



if [[ $problemTest == 1 ]]; then
    echo -e "\e[31m install LAMP failed! \e[0m"
fi
echo "Remember: if you have perviously installed any web server you must remove it and restart apache2"
