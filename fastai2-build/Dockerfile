FROM nvidia/cuda:10.2-base

# build argument: if it's not passed, default to fastai2
ARG DOCKER_USER=fastai2-user

# If BUILD=dev an editable install of fastai and fastcore will be installed instead
ARG BUILD=prod
# For Build Caching
ARG BUILDKIT_INLINE_CACHE=1

# Copy code from repo to container
COPY . /home/docker-fastai2/fastai2

# Copy installer from repo to container
WORKDIR /home
RUN apt update && apt install -y git wget
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN chmod u+x Miniconda3-latest-Linux-x86_64.sh
RUN ./Miniconda3-latest-Linux-x86_64.sh -b -p /miniconda3
ENV PATH="/miniconda3/bin:${PATH}"
RUN conda env create -f /home/docker-fastai2/fastai2/environment.yml
COPY ./docker/fastai2-build/install_within_container.sh /root/install_within_container.sh

# Run installer
RUN cd /root && chmod u+x install_within_container.sh && ./install_within_container.sh && rm -rf install_within_container.sh

# Create a group and user. This will allow us to avoid running things as
# root, which is dangerous
RUN useradd -ms /bin/bash $DOCKER_USER

# Assign the conda directory to that user
RUN chown --recursive $DOCKER_USER:$DOCKER_USER /miniconda3

# Tell docker that all future commands should run as the non-root user
USER $DOCKER_USER

# Copy bash scripts
WORKDIR /home
COPY ./docker/fastai2-build/entrypoint.sh .
COPY ./docker/fastai2-build/run_jupyter.sh .
RUN chmod -R u+rwx .

# This ensures that the fastai2 conda env will be
# loaded before the command specified on the
# command line is executed
ENTRYPOINT ["/bin/bash", "/home/entrypoint.sh"]
