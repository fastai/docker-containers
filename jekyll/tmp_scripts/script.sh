python -m ensurepip --upgrade
pip install -Uq nbdev watchdog[watchmedo] jupyter
python -m ipykernel install
apt install -y ruby-full
gem install jekyll bundler
bundle config set system 'true'
bundle install
wget https://github.com/jgm/pandoc/releases/download/2.9.1.1/pandoc-2.9.1.1-1-amd64.deb
dpkg -i pandoc-2.9.1.1-1-amd64.deb
rm -rf Gemfile*
rm -rf /var/lib/gems/*/cache
rm -rf /var/lib/gems/*/doc
rm -rf /usr/share/ri
