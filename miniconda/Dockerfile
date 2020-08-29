FROM fastai/jekyll

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=/root
WORKDIR /root

COPY setup_conda.sh ./
RUN bash setup_conda.sh
RUN rm setup_conda.sh

CMD [ "/bin/bash" ]

