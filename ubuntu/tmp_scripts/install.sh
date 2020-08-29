apt-get update --fix-missing
bash --login -c script.sh
apt-get clean
rm -rf /var/lib/apt/lists/* install.sh script.sh

