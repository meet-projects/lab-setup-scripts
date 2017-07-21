#!/bin/sh
#
#This script copies startlab, endlab, and alias_lab_scripts.sh to /usr/local/bin.  It then appends a statement to the .bashrc file to source (run) the alias_lab_scripts.sh so that the aliases will be created in each new session (i.e. every time someone opens a Linux shell).
#
#Ted Golfinopoulos, 21 July 2017

echo "--------------------------"
echo "Copying startlab, endlab, and alias_lab_scripts.sh scripts to /usr/local/bin..."
cp startlab /usr/local/bin
cp endlab /usr/local/bin
cp alias_lab_scripts.sh /usr/local/bin
echo "...done"

echo ""

echo "Change permissions of startlab and endlab to make them executable..."

chmod u+rwx /usr/local/bin/startlab
chmod u+rwx /usr/local/bin/endlab

echo "...done"

echo ""

cd ~

echo "Appending to .bashr file a call to source alias_lab_scripts.sh..."

echo "#Make sure aliases to startlab and endlab are created in every session" >> .bashrc
echo "source /usr/local/bin/alias_lab_scripts.sh" >> .bashrc
echo "" >> .bashrc
echo "#Put current directory in path" >> .bashrc
echo "export PATH=$PATH:." >> .bashrc
echo "" >> .bashrc
echo "...done editing .bashrc file"
echo "--------------------------"
