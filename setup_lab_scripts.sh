#!/bin/bash
#
#This script copies startlab, endlab, and alias_lab_scripts.sh to /usr/local/bin.  It then appends a statement to the .bashrc file to source (run) the alias_lab_scripts.sh so that the aliases will be created in each new session (i.e. every time someone opens a Linux shell).
#
#Ted Golfinopoulos, 21 July 2017

echo "--------------------------"
echo "Copying startlab, endlab, and alias_lab_scripts.sh scripts to /usr/local/bin..."
sudo cp startlab /usr/local/bin
sudo cp endlab /usr/local/bin
sudo cp alias_lab_scripts.sh /usr/local/bin
echo "...done"

echo ""

echo "Change permissions of startlab and endlab to make them executable..."

sudo chmod u+rwx /usr/local/bin/startlab
sudo chmod u+rwx /usr/local/bin/endlab

echo "...done"

echo ""

cd ~

echo "Appending to .bashrc file a call to source alias_lab_scripts.sh..."

echo "#Make sure aliases to startlab and endlab are created in every session" >> .bashrc
echo "source /usr/local/bin/alias_lab_scripts.sh" >> .bashrc
echo "" >> .bashrc
echo "#Put current directory in path" >> .bashrc
echo "export PATH=$PATH:." >> .bashrc
echo "" >> .bashrc
echo "...done editing .bashrc file"

echo ""
echo "Try to install python3, idle3, git, gimp, and pygame (if already installed, will tell you so and exit)..."
sudo apt-get install python3
sudo apt-get install idle3
sudo apt-get install git
sudo apt-get install gimp
sudo pip3 install pygame
echo "...done"

echo "setup script finished"
echo "(: NICE TO MEET YOU - HAVE A NICE DAY! :)"
echo "--------------------------"
