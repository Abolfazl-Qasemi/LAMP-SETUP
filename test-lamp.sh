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
if  ! grep -q "phpinfo();" /var/www/html/info.php || ! grep -q "<?php" /var/www/html/info.php || ! grep -q "?>" /var/www/html/info.php ; then 
    echo -e "\e[31m PHP info content is wrong \e[0m"
    problemTest=1
fi 

#port test
if [[ "$(sudo ss -unlpt | grep :80 | cut -d "(" -f3 | cut -d '"' -f2)" != "apache2" ]]; then
    echo -e "\e[31m Port error\e[0m"
    problemTest=1
fi

#test database -> if you cannot run simple command(SELECT 1) then print error
if ! sudo mariadb -u root -e "SELECT 1;" > /dev/null 2>&1; then 
    echo -e "\e[31m date base error\e[0m"
    problemTest=1
fi



if [[ $problemTest == 1 ]]; then
    echo -e "\e[31m install LAMP failed! \e[0m"
fi
echo "Remember: if you have perviously installed any web server you must remove it and restart apache2"
