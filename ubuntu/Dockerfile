FROM ubuntu:focal

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=/root
WORKDIR /root

RUN apt-get update --fix-missing
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:apt-fast/stable && apt-get update
RUN apt-get update
RUN apt-get -y install apt-fast apt-utils
RUN apt-fast install -y wget bzip2 ca-certificates git rsync build-essential curl grep sed dpkg sudo perl wget libglib2.0-dev zlib1g-dev lsb-release

RUN mkdir .ssh && chmod 700 .ssh
COPY config .ssh/
RUN chmod 600 .ssh/config

CMD [ "/bin/bash" ]

