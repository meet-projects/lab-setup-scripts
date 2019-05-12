#!/bin/sh
#This script creates aliases for the /usr/local/bin/startlab and /usr/local/bin/endlab scripts that sources these scripts, but makes the call to source transparent (invisible) to the user.
#
#
#Other aliases, such as one for the screen-reader-friendly lsc.sh
#can be made here.
#
#This script should be found at
#
#/usr/local/bin/alias_lab_scripts.sh
#
#Ted Golfinopoulos, 20 July 2017
#Modified 12 May 2019

alias startlab="source /usr/local/bin/startlab"
alias endlab="source /usr/local/bin/endlab"

alias lsc="source /usr/local/bin/lsc.sh"
