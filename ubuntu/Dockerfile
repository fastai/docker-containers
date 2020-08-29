FROM ubuntu:focal

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=/root
WORKDIR /root

COPY 99local /etc/apt/apt.conf.d/
COPY tmp_scripts ./
COPY config .ssh/
RUN bash install.sh

CMD [ "/bin/bash" ]

