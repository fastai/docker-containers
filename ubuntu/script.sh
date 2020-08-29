apt-get install -y software-properties-common
add-apt-repository -y ppa:apt-fast/stable
apt-get update
apt-get -y install apt-fast apt-utils
apt-fast install -y wget bzip2 ca-certificates git rsync build-essential curl grep sed dpkg sudo perl wget libglib2.0-dev zlib1g-dev lsb-release
mkdir .ssh

