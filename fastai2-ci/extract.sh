#!/bin/bash
# Extract test data for CI

mkdir -p $HOME/.fastai/data 
find /root/.fastai/archive/ -name "*.tgz" -exec echo tar -xzvf -C $HOME/.fastai/data \;
