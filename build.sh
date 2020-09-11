#!/bin/bash

echo ${PWD##*/}:latest
echo $(<image)
docker build . -t fastai/${PWD##*/}:latest -t fastai/${PWD##*/}:$(date +%F) --build-arg IMAGE=$(<image) -f ../Dockerfile

