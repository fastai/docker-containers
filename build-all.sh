#!/bin/bash
set -e
cd $(dirname "$0") #make sure we are in the root of the repo

for d in ubuntu jekyll fastai codespaces; do
    cd $d
    echo "building $d"
    ../build.sh
    ../push.sh
    cd ..
done
