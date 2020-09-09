mkdir /tmp
chmod 1777 /tmp
apt-get update --fix-missing
bash -li script.sh
apt-get clean
rm -rf /var/lib/apt/lists/* install.sh script.sh

