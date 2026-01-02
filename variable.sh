#!/bin/bash


packagesServices=("apache2" "mariadb") #for chek status
allPackages=("apache2" "mariadb-server" "php" "php-mysql" "libapache2-mod-php" "htop")
warningAllert=n
beforeInstalled=()
problemTest=0
menuInput=0