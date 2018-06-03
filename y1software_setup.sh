#!/bin/bash
#
#This script copies startlab, endlab, and alias_lab_scripts.sh to /usr/local/bin.  It then appends a statement to the .bashrc file to source (run) the alias_lab_scripts.sh so that the aliases will be created in each new session (i.e. every time someone opens a Linux shell).
#
#Ted Golfinopoulos, 21 July 2017
#Modified: 13 May 2018

echo ""
echo "Try to install python3, idle3, git, gimp, and pygame (if already installed, will tell you so and exit)..."
#Do this first, before switching directories, so the requirements file is found.
sudo apt-get update -y 
sudo apt-get -y install python
sudo apt-get -y install python3
sudo apt-get -y install idle3
sudo apt-get -y install git
sudo apt-get -y install gimp
sudo apt-get -y install libreoffice #This doesn't come standard, it seems, on the Ubuntu distribution we're using

#Install pip and pip3 and dependencies
sudo apt-get -y install python-pip
sudo apt-get -y install python3-pip
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
echo "Append commands to .bashrc of student and students users, as well."
user_list=(support student students testuser)

for this_user in ${user_list[*]}; do
    this_dir="/home/$this_user"
    this_file="$this_dir/.bashrc"
    this_owner=$(stat -c "%U" $this_file)
    #Modify permissions of .bashrc file so support can write into it
    sudo chmod a+w $this_file
    echo "#Make sure aliases to startlab and endlab are created in every session" >> $this_file
    echo "source /usr/local/bin/alias_lab_scripts.sh" >> $this_file
    echo "" >> $this_file
    echo "#Put current directory in path" >> $this_file
    echo "export PATH=$PATH:." >> $this_file
    echo "" >> $this_file
    echo "#Alias Python3 version of idle to idle3 - doesn't seem to have this reference by default"
    echo "alias idle3=\"idle-python3.6\""
    echo "" >> $this_file
    #Remove newly-added permissions allowing all users to write into .bashrc file
    sudo chmod a-w $this_file
    sudo chmod u+w $this_file #Allow user to edit own .bashrc
    echo "...done editing $this_file file"
done

echo ""
echo "Changing language settings for date/time to English"
sudo update-locale LC_ALL=en_US.UTF-8
echo "...done"


echo "setup script finished"
echo "(: NICE TO MEET YOU - HAVE A NICE DAY! :)"
echo "--------------------------"
