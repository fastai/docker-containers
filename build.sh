#!/bin/bash

echo ${PWD##*/}:latest
echo $(<image)
docker build . -t fastai/${PWD##*/}:latest --build-arg IMAGE=$(<image) -f ../Dockerfile

