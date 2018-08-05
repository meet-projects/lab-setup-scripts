#!/bin/bash
#Install pyenv
#5 Aug. 2018 TG

###
#Install pyenv
###
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

#Add to .bashrc file for pyenv
this_file="~/.bashrc"
echo 'export PATH="/home/golfit/.pyenv/bin:$PATH"' >> $this_file
echo 'eval "$(pyenv init -)"' >> $this_file
echo 'eval "$(pyenv virtualenv-init -)"' >> $this_file

bash this_file
pyenv update
