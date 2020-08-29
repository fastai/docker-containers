FROM ubuntu:focal

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=/root
WORKDIR /root

COPY 00_disable-cache-directories /etc/apt/apt.conf.d/
RUN apt-get update --fix-missing \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:apt-fast/stable \
    && apt-get update \
    && apt-get update \
    && apt-get -y install apt-fast apt-utils \
    && apt-fast install -y wget bzip2 ca-certificates git rsync build-essential curl grep sed dpkg sudo perl wget libglib2.0-dev zlib1g-dev lsb-release \
    && mkdir .ssh

COPY config .ssh/
RUN chmod 700 .ssh \
    && chmod 600 .ssh/config

CMD [ "/bin/bash" ]

