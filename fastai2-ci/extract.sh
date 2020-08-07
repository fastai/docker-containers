#!/bin/bash
# Extract test data for CI

mkdir -p $PWD/.fastai/data 
find /root/.fastai/archive/ -name "*.tgz" -exec echo tar -xzvf -C $PWD/.fastai/data \;
