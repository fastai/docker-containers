mv 99local /etc/apt/apt.conf.d/
apt-get -y upgrade
apt-get -y install apt-utils
apt update
apt-get install -y --no-install-recommends software-properties-common dirmngr gpg-agent wget bzip2 ca-certificates git rsync build-essential curl grep sed dpkg sudo perl wget jq libglib2.0-dev zlib1g-dev lsb-release tmux less htop exuberant-ctags openssh-client vim-tiny python-is-python3 python3-pip python3-dev dos2unix
python -m ensurepip --upgrade
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C99B11DEB97541F0
apt-add-repository https://cli.github.com/packages
apt install -y gh

echo 'set nocompatible' > .vimrc

mkdir .ssh
mv config .ssh/
chmod 700 .ssh
chmod 600 .ssh/config

