#!/bin/bash
echo "::group::Pushing ${PWD##*/}"  
docker push fastai/${PWD##*/}
echo "::endgroup::"  
