#!/bin/bash

cd /home/$USER/Desktop

packagesServices=("apache2" "mariadb") #for chek status
allPackages=("apache2" "mariadb-server" "php" "php-mysql" "libapache2-mod-php" )
warningAllert=n