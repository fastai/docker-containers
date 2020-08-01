#!/bin/bash
set -e
set -x

# Clone and install fastai2 and create fastai2 conda env
# with all the dependencies needed by fastai2

# Get the latest fastcore
cd /home/docker-fastai2/
git clone https://github.com/fastai/fastcore

cd /home/docker-fastai2/fastai2
source activate fastai2
conda install -y jupyter jupyterlab nodejs ipympl
# Instruct pip not to use any caching, so the image stays small
pip config set global.cache-dir false

if [[ $BUILD == "prod" ]]; then
    echo "Excuting a production build."
    # Install fastai2
    pip install .
    # Install the latest fastcore
    cd ../fastcore && pip install .
    # Remove repositories
    cd .. && rm -rf fastai2 && rm -rf fastcore
elif [[ $BUILD == "dev" ]]; then
    # editable installs of fastai2 and fastcore
    echo "Excuting a development with editable installs."
    pip install -e ".[dev]"
    cd ../fastcore && pip install -e ".[dev]";
    pip install nbdev
fi

# Clean conda cache
conda clean --all -y
rm -rf /miniconda3/pkgs/*

# Remove Miniconda installer
rm -rf Miniconda3*.sh

# Clean apt cache
rm -rf /var/lib/apt/lists/*
