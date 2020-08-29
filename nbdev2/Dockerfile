FROM fastai/miniconda

SHELL ["/bin/bash", "--login", "-c"]
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=/root
WORKDIR /root

RUN mamba install -y nbdev && conda clean --all -y

CMD [ "/bin/bash" ]

