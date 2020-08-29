cat << EOF > .bashrc
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
EOF

export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
apt-fast install -y ruby-full
gem install jekyll bundler
cd tmp
bundle config set system 'true'
bundle install
rm -rf tmp

