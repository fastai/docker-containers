#!/bin/bash
set -e
cd $(dirname "$0") #make sure we are in the root of the repo

for d in ubuntu jekyll miniconda nbdev fastai; do
#for d in miniconda nbdev fastai; do
    cd $d
    echo "building $d"
    ../build.sh
    ../push.sh
    cd ..
done
