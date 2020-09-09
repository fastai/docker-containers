mv 99local /etc/apt/apt.conf.d/
apt-get -y upgrade
apt-get -y install apt-utils
apt-get install -y --no-install-recommends wget bzip2 ca-certificates git rsync build-essential curl grep sed dpkg sudo perl wget libglib2.0-dev zlib1g-dev lsb-release tmux less htop ctags openssh-client vim-tiny python-is-python3 python3-pip python3-dev

python -m pip install -U pip 
echo 'set nocompatible' > .vimrc

mkdir .ssh
mv config .ssh/
chmod 700 .ssh
chmod 600 .ssh/config

