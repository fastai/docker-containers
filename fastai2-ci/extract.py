"""
Extract test data for CI
"""
import pickle
from fastai2.data.external import file_extract
from pathlib import Path

with open('/root/ci_files.pkl', 'rb') as f:
    file_list = pickle.load(f)
    
for f in file_list:
    print(f'extracting {f}')
    file_extract(f, dest=f'{Path.home()}/.fastai/data')
