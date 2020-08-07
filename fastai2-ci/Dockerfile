FROM fastdotai/fastai2

COPY download_testdata.py ./
COPY extract.sh ./
RUN chmod u+x extract.sh
RUN python download_testdata.py
