FROM pytorch/pytorch

ARG BUILD=dev

RUN apt-get install -y software-properties-common && apt-get update
RUN add-apt-repository -y ppa:git-core/ppa && apt-get update && apt-get install -y git libglib2.0-dev
RUN pip install albumentations \
    jupyter \
    matplotlib \
    pandas \
    pyyaml \
    "fastprogress>=0.1.22" \
    nbdev \
    neptune-cli \
    opencv-python \
    pillow \
    pyarrow \
    pydicom \
    scikit-learn \
    scikit-image \
    scipy \
    "sentencepiece<0.1.90" \
    spacy \
    tensorboard \
    wandb

RUN git clone https://github.com/fastai/fastai-docs.git --depth 1
RUN git clone https://github.com/fastai/fastai2.git --depth 1  && git clone https://github.com/fastai/fastcore.git --depth 1
RUN /bin/bash -c "if [[ $BUILD == 'prod' ]] ; then echo \"Production Build\" && cd fastai2 && pip install . && cd ../fastcore && pip install .; fi"
RUN /bin/bash -c "if [[ $BUILD == 'dev' ]] ; then echo \"Development Build\" && cd fastai2 && pip install -e \".[dev]\" && cd ../fastcore && pip install -e \".[dev]\"; fi"
RUN echo '#!/bin/bash\njupyter notebook --ip=0.0.0.0 --port=8888 --allow-root --no-browser' >> run_jupyter.sh
COPY download_testdata.py ./
COPY extract.sh ./
RUN chmod u+x extract.sh
RUN chmod u+x run_jupyter.sh
