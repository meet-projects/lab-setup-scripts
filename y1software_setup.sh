#!/bin/bash
#
#This script copies startlab, endlab, and alias_lab_scripts.sh to /usr/local/bin.  It then appends a statement to the .bashrc file to source (run) the alias_lab_scripts.sh so that the aliases will be created in each new session (i.e. every time someone opens a Linux shell).
#
#Ted Golfinopoulos, 21 July 2017
#Modified: 13 May 2018

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
echo "Changing language settings for date/time to English"
sudo update-locale LC_ALL=en_US.UTF-8
echo "...done"

echo ""
echo "Try to install python3, idle3, git, gimp, and pygame (if already installed, will tell you so and exit)..."
sudo apt-get -y install python
sudo apt-get -y install python3
sudo apt-get -y install idle3
sudo apt-get -y install git
sudo apt-get -y install gimp

#Install pip and pip3 and dependencies
sudo apt-get install python-pip
sudo apt-get install python3-pip
sudo pip install -U setuptools
sudo pip3 install -U setuptools

#Install Y1 dependencies
sudo pip install -r y1requirements.txt
sudo pip3 install -r y1requirements.txt
#sudo pip install pygame
#sudo pip3 install pygame
#sudo pip install numpy #New in 2018 per Y1 request
#sudo pip install matplotlib #New in 2018 per Y1 request
#sudo pip3 install numpy #New in 2018 per Y1 request
#sudo pip3 install matplotlib #New in 2018 per Y1 request
echo "...done"

echo "setup script finished"
echo "(: NICE TO MEET YOU - HAVE A NICE DAY! :)"
echo "--------------------------"
