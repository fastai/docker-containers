ARG IMAGE=error_please_pass_build_args
FROM $IMAGE

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=/root
ENV SHELL /bin/bash
WORKDIR /root

COPY tmp_scripts ./
RUN bash install.sh

CMD [ "/bin/bash" ]

