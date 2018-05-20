#The original version of this software may have been from 2016-2017 YL2 MEETconf by Lorenzo Brown.
#
#Last updated 13 May 2018 for Y2 summer, Ted Golfinopoulos


#!/bin/sh
sudo apt-get update -y

#Note: Don't upgrade pip to Version 10 in Ubuntu 16.04, as of 13 May 2018, unless you want to sort out conflict between user-version of pip and system-wide version.  Version 8.1 is okay

#Install git
sudo apt-get install git

#Install nodejs and npm
sudo apt-get install nodejs
sudo apt-get install npm

#install inkscape
sudo add-apt-repository ppa:inkscape.dev/stable
#sudo apt-get update
sudo apt install inkscape -y

#slack
sudo apt-add-repository -y ppa:rael-gc/scudcloud

echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt update
sudo apt install scudcloud -y
#sudo apt remove scudcloud && sudo apt autoremove


#pencil
#wget “http://evoluspencil.googlecode.com/files/#evoluspencil_2.0.5_all.deb”
#sudo dpkg -i evoluspencil_2.0.5_all.deb
sudo apt install pencil

#kdenlive
sudo add-apt-repository ppa:kdenlive/kdenlive-stable
#sudo apt-get update -
sudo apt-get install kdenlive -y
sudo apt install kdenlive -yk
sudo ppa-purge ppa:kdenlive/kdenlive-stable

#Install virtual environment
sudo apt-get install python-virtualenv

#Install list of requirements
sudo pip install -r y2requirements.txt
sudo pip3 install -r y2requirements.txt

#Install Sublime text editor
#Install the GPG key
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
#Ensure apt is set up to work with https sources: 
sudo apt-get install apt-transport-https
#Install stable version
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
#Update apt sources and install Sublime Text
###
sudo apt-get update ###
###
sudo apt-get install sublime-text

#Install Brackets.io text editor - force "yes" response to all queries
sudo add-apt-repository --yes ppa:webupd8team/brackets
###
sudo apt-get update ###
###
sudo apt-get install brackets #Install brackets

#Install Microsoft vscode text editor (run with "code" command)
sudo apt-get install code
code --install-extension ms-python.python #Install python extension

#Download bootstrap with npm
cd ~ #Move to home directory
npm install bootstrap@3

#Download and unzip postman
cd ~
wget -O postman.tar.gz https://dl.pstmn.io/download/version/6.1.2/linux64
tar -xvf postman.tar.gz

#Download jQuery
cd ~
wget https://code.jquery.com/jquery-3.3.1.min.js
