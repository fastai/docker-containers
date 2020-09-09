pip install -Uq nbdev
python -m ipykernel install
apt install -y ruby-full
gem install jekyll bundler
bundle config set system 'true'
bundle install
rm -rf Gemfile*
rm -rf /var/lib/gems/*/cache
rm -rf /var/lib/gems/*/doc
rm -rf /usr/share/ri

