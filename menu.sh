#!/bin/bash

cd /home/$USER/Desktop

source LAMP-SETUP/variable.sh

echo "Welcome to LAMP-setup!"
echo -e "\e[36mFor install and test ---------> 1 \n\nFor remove -------------------> 2 \n\nTo test the installed or not -> 3\e[0m \n\n\n\n"
read -p "Select number and press enter: " menuInput

case "$menuInput" in
    1)
    source LAMP-SETUP/install-lamp.sh
    source LAMP-SETUP/test-lamp.sh
    ;;
    2) 
    source LAMP-SETUP/remove-lamp.sh
    ;;
    3) 
    source LAMP-SETUP/test-lamp.sh
    ;;
esac