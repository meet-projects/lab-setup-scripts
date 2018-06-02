#!/bin/bash
#Coordinate setup for all three years
#T. Golfinopoulos, 22 May 2018
MY_PATH=$(pwd)
echo "======================="
echo "Y1 setup starting..."
echo "======================="
source y1software_setup.sh
echo "======================="
echo "Y2 setup starting..."
echo "======================="
cd $MY_PATH #Return to initial directory
source y2software_setup.sh
echo "======================="
echo "Y3 setup starting..."
echo "======================="
cd $MY_PATH #Return to initial directory
source y3software_setup.sh

echo "======================="
echo "MEET Computer setup complete :)"
echo "======================="

echo "Software setup completed on $(date)" > ~/meet_software_date.txt
cd $MY_PATH

rm check_name.txt #Remove list of users for startlab - not needed, anyway, since will be pulled fresh in each instance the script is run
