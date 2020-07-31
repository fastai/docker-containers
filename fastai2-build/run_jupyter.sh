#!/bin/bash
export PATH=/miniconda3/bin:${PATH}
source activate fastai2
jupyter notebook --ip=0.0.0.0 --no-browser --allow-root --port=8888
