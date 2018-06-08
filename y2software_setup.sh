#The original version of this software may have been from 2016-2017 YL2 MEETconf by Lorenzo Brown.
#
#updated 13 May 2018 for Y2 summer, Ted Golfinopoulos
#Last updated 3 June 2018 TG

echo "Note: the Y1 sotware setup should be run first, as there are several co-dependencies"

echo "Update packages..."
sudo apt-get update -y

#Add repositories
sudo apt-add-repository -y ppa:rael-gc/scudcloud #slack
sudo add-apt-repository -y ppa:kdenlive/kdenlive-stable #kdenlive
sudo add-apt-repository --yes ppa:webupd8team/brackets #brackets text editor
sudo add-apt-repository -y ppa:inkscape.dev/stable #inkscape
sudo add-apt-repository -y ppa:chromium-daily/stable #chromium-browser

#!/bin/sh
sudo apt-get update -y
echo "...done"
echo "===Y2==="

#Note: Don't upgrade pip to Version 10 in Ubuntu 16.04, as of 13 May 2018, unless you want to sort out conflict between user-version of pip and system-wide version.  Version 8.1 is okay

echo "Install software dependencies..."
#Install git
sudo apt-get -y install git

#Install pip and pip3 and dependencies
sudo apt-get -y install python-pip
sudo apt-get -y install python3-pip
sudo pip install -U setuptools
sudo pip3 install -U setuptools


#Install nodejs and npm
sudo apt-get -y install nodejs
sudo apt-get -y install npm

#install inkscape
#sudo apt-get update
sudo apt install inkscape -y
sudo apt-get -y install chromium-browser #Install Google Chrome

#Install curl
sudo apt-get -y install curl

#Install snap for installations
sudo apt-get -y install snap

#slack - team communication
sudo snap install slack --classic

echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt update
sudo apt install scudcloud -y
#sudo apt remove scudcloud && sudo apt autoremove


#pencil
#wget “http://evoluspencil.googlecode.com/files/#evoluspencil_2.0.5_all.deb”
#sudo dpkg -i evoluspencil_2.0.5_all.deb
#sudo apt-get -y install pencil
wget http://pencil.evolus.vn/dl/V3.0.4/Pencil_3.0.4_amd64.deb
sudo dpkg -i Pencil_3.0.4_amd64.deb
sudo apt-get install -f

#kdenlive

#sudo apt-get update -
sudo apt-get -y install kdenlive -y
sudo apt install kdenlive -yk
sudo ppa-purge ppa:kdenlive/kdenlive-stable

#Install virtual environment
sudo apt-get -y install python-virtualenv


#Install list of requirements
echo "Installing Y2 Python dependencies..."
sudo pip install -r y2requirements.txt
sudo pip3 install -r y2requirements.txt
echo "...done installing y2 Python dependencies"
#Install Sublime text editor
#Install the GPG key
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
#Ensure apt is set up to work with https sources: 
sudo apt-get -y install apt-transport-https
#Install stable version
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
#Update apt sources and install Sublime Text
###
#sudo apt-get update ###
###
sudo apt-get -y install sublime-text

#Install Brackets.io text editor - force "yes" response to all queries
###
#sudo apt-get update ###
###
sudo apt-get -y install brackets #Install brackets

#Install Microsoft vscode text editor (run with "code" command)
#Somehow, code is not in repository list - not sure what Ubuntu this is....
#Nor does the .gpg key get added - Had to do that manually with 
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys <key>
#per instructions at https://chrisjean.com/fix-apt-get-update-the-following-signatures-couldnt-be-verified-because-the-public-key-is-not-available/
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get -y install code
code --install-extension ms-python.python #Install python extension

echo "===Y2==="
echo "Download particular dependencies and copy to user directories"

#Download bootstrap with npm
cd ~ #Move to home directory
sudo npm install bootstrap@3

#Download and unzip postman
cd ~
wget -O postman.tar.gz https://dl.pstmn.io/download/latest/linux64
tar -xf postman.tar.gz #Suppress verbose output

#Download jQuery
cd ~
wget https://code.jquery.com/jquery-3.3.1.min.js

user_list=(student students testuser)
for this_user in ${user_list[*]}; do
    this_dir="/home/$this_user"
    sudo cp -r jquery-3.3.1.min.js $this_dir #jQuery
    sudo cp -r node_modules $this_dir #Bootstrap
    sudo cp -r Postman $this_dir #Postman

    #Change ownership of files to local user
    if [ $this_user == "student" ]
    then
        this_owner="students"
    else
        this_owner=$this_user
    fi

    sudo chown -R $this_owner $this_dir/jquery-3.3.1.min.js
    sudo chown -R $this_owner $this_dir/node_modules
    sudo chown -R $this_owner $this_dir/Postman
done

#Download ngrok and place in /usr/local/etc
cd ~
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
sudo mv ngrok /usr/local/etc

echo "Appending to .bashrc an alias of ngrok to point to /usr/local/etc/ngrok"
echo "Also, append commands to setup virtualenvwrapper"
user_list=(support student students testuser)

for this_user in ${user_list[*]}; do
    this_dir="/home/$this_user"
    this_file="$this_dir/.bashrc"
    this_owner=$(stat -c "%U" $this_file)
    
    #Modify permissions of .bashrc file so support can write into it
    sudo chmod a+w $this_file
    echo "#Alias ngrok to point to /usr/local/etc/ngrok" >> $this_file
    echo "alias ngrok=\"/usr/local/etc/ngrok\"" >> $this_file
    echo "" >> $this_file
    
    #Set up virtualenvwrapper
    echo "#Set up environment variables and source script containing virtualenvwrapper functions" >> $this_file
    echo "export WORKON_HOME=$this_dir/.virtualenvs" >> $this_file
    echo "export PROJECT_HOME=$this_dir/Devel" >> $this_file
    echo "source /usr/local/bin/virtualenvwrapper.sh" >> $this_file
    
    #Remove newly-added permissions allowing all users to write into .bashrc file
    sudo chmod a-w $this_file
    sudo chmod u+w $this_file #Allow user to edit own .bashrc
    echo "...done editing $this_file file"
done

echo "================================"
echo "Y2 setup done"
