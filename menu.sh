#!/bin/bash

cd /home/$USER/Desktop

source LAMP-setup/variable.sh

echo "Welcome to LAMP-setup"
echo -e "For install and test ---------> 1 \nFor remove -------------------> 2 \nTo test the installed or not -> 3"
read -p "Select number and press enter: " menuInput

case "$menuInput" in
    1)
    source LAMP-setup/install-lamp.sh
    source LAMP-setup/test-lamp.sh
    ;;
    2) 
    source LAMP-setup/remov-lamp.sh
    ;;
    3) 
    source LAMP-setup/test-lamp.sh
    ;;
esac