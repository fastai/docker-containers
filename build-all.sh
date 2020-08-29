#!/bin/bash
for d in ubuntu jekyll miniconda nbdev; do
    cd $d
    echo "building $d"
    ../build.sh
    ../push.sh
done

