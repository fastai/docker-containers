#!/bin/bash
# Extract test data for CI

mkdir -p $HOME/.fastai/data
find /root/.fastai/archive/ -name "*.tgz" -exec tar -xzvf {} -C $HOME/.fastai/data \;
