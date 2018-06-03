#!/bin/bash
#Setup for Y3 summer 2018
#Last updated 22 May 2018
#T. Golfinopoulos, 22 May 2018

echo "================================"
echo "Note: the Y2 software setup should be run first, as Y3 has the same dependencies"

sudo npm install -g react-native-cli #Install React native
sudo npm install -g ionic cordova #Install ionic framework and cordova  - (for building apps)
sudo pip install jupyterlab #Install Jupyter lab
sudo pip3 install jupyterlab #Install Jupyter lab

echo "Y3 setup done"
