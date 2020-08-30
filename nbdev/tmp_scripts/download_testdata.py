"""
Downloads test data used in CI
"""
from IPython import get_ipython
from fastai.data.external import download_data, URLs
from fastai.torch_core import parallel
import pickle

urls = ['ADULT_SAMPLE','BIWI_SAMPLE','CAMVID_TINY','CIFAR','COCO_TINY','IMDB','IMDB_SAMPLE',
        'ML_SAMPLE','MNIST','MNIST_SAMPLE','MNIST_TINY','PETS']
url_list = [URLs.__dict__[k] for k in urls]
files = [(print(f'Downloading {u}'), download_data(u)) for u in url_list]
