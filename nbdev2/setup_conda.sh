#!/usr/bin/env bash
set -e

cd

case "$OSTYPE" in
  darwin*)  DOWNLOAD=https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh ;;
  linux*)   DOWNLOAD=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh  ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

case "$SHELL" in
  /bin/zsh*)   SHELL_NAME=zsh  ;;
  /bin/bash*)  SHELL_NAME=bash ;;
  *)        echo "unknown: $SHELL" ;;
esac

cat << EOF > .condarc
channels:
  - fastai
  - pytorch
  - defaults
channel_priority: strict
EOF

wget $DOWNLOAD
bash Miniconda3-latest*.sh -b
~/miniconda3/bin/conda init $SHELL_NAME
rm Miniconda3-latest*.sh

perl -n  -e 'print if     />>> conda/../<<< conda/' .bashrc > .condainit
perl -ni -e 'print unless />>> conda/../<<< conda/' .bashrc
echo source ~/.condainit >> .bashrc
. .condainit

conda install -y mamba python
