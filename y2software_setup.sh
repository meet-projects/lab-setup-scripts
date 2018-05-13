
#!/bin/sh
apt-get update -y

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

