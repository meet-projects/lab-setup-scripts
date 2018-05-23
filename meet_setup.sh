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
cd $MY_PATH
