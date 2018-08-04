curl https://raw.githubusercontent.com/meet-projects/lab-setup-scripts/master/y2requirements_with_versions.txt >> requirements.txt
pyenv install 3.6.5
pyenv global 3.6.5
echo "SQLAlchemy==1.1.11" >> requirements.txt
pip install -r requirements.txt
rm requirements.txt
