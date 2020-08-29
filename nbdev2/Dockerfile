FROM fastai/miniconda

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=/root
WORKDIR /root
SHELL ["/bin/bash", "--login", "-c"]

RUN mamba install -y nbdev
RUN conda clean --all -y

CMD [ "/bin/bash" ]

