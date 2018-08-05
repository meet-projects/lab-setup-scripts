#!/bin/bash
cd ~
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
echo "export PATH=\"~/.pyenv/bin:\$PATH\"" >> ~/.bashrc
echo "eval \"\$(pyenv init -)\"" >> ~/.bashrc
echo "eval \"\$(pyenv virtualenv-init -)\"" >> ~/.bashrc
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
curl https://raw.githubusercontent.com/meet-projects/lab-setup-scripts/master/y2requirements_with_versions.txt >> requirements.txt
pyenv install 3.6.5
pyenv global 3.6.5
echo "SQLAlchemy==1.1.11" >> requirements.txt
pip install --upgrade pip
pip install -r requirements.txt
rm requirements.txt
sudo apt-get install -y pylint
