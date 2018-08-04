curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
echo "export PATH=\"~/.pyenv/bin:\$PATH\"" >> ~/.bashrc
echo "eval \"\$(pyenv init -)\"" >> ~/.bashrc
echo "eval \"\$(pyenv virtualenv-init -)\"" >> ~/.bashrc
