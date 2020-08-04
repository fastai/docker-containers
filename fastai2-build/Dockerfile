FROM nvidia/cuda:10.2-base as build_stage

ARG DOCKER_USER=fastai2-user
ARG BUILD=prod
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

# Create a group and user and assign the conda directory to that user
RUN useradd -ms /bin/bash $DOCKER_USER
RUN chown --recursive $DOCKER_USER:$DOCKER_USER /miniconda3

# Stage 2 of mutli-part build
FROM nvidia/cuda:10.2-base
ARG DOCKER_USER=fastai2-user
ARG BUILD=prod
ARG BUILDKIT_INLINE_CACHE=1

# Create a non-root user
RUN useradd -ms /bin/bash $DOCKER_USER
COPY --chown=$DOCKER_USER --from=build_stage /miniconda3 /miniconda3

# Set permissions
WORKDIR /home
RUN chmod a+rwx .

# Tell docker that all future commands should run as the non-root user
USER $DOCKER_USER
COPY ./docker/fastai2-build/conda_init.txt /home/conda_init.txt
RUN cat /home/conda_init.txt >> ~/.bashrc
COPY --chown=$DOCKER_USER ./docker/fastai2-build/entrypoint.sh /home/entrypoint.sh
COPY --chown=$DOCKER_USER ./docker/fastai2-build/run_jupyter.sh /home/run_jupyter.sh
RUN chmod u+x entrypoint.sh
RUN chmod u+x run_jupyter.sh

# Load the fastai2 conda environment before executing any commands
ENTRYPOINT ["/bin/bash", "/home/entrypoint.sh"]
