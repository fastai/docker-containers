apt-fast install -y ruby-full
gem install jekyll bundler
cd tmp
bundle config set system 'true'
bundle install
rm -rf tmp Gemfile*

