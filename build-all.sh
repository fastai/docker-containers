#!/bin/bash
cd ubuntu
../build.sh
../push.sh
cd jekyll
../build.sh
../push.sh
cd miniconda
../build.sh
../push.sh
cd nbdev
../build.sh
../push.sh

