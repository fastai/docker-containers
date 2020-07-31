# Stage 1: build

FROM nvidia/cuda:10.2-base as build_stage

# build argument: if it's not passed, default to fastai2
ARG DOCKER_USER=fastai2-user

# If BUILD=dev an editable install of fastai and fastcore will be installed instead
ARG BUILD=prod
# For Build Caching
ARG BUILDKIT_INLINE_CACHE=1

# Copy code from repo to container
COPY . /home/docker-fastai2/fastai2

# Copy installer from repo to container
COPY ./docker/fastai2-build/install_within_container.sh /root/install_within_container.sh

# Run installer
RUN cd /root && chmod u+x install_within_container.sh && ./install_within_container.sh && rm -rf install_within_container.sh

# Create a group and user. This will allow us to avoid running things as
# root, which is dangerous
RUN useradd -ms /bin/bash $DOCKER_USER

# Assign the conda directory to that user
RUN chown --recursive $DOCKER_USER:$DOCKER_USER /miniconda3

# Stage 2: final touch ups
FROM nvidia/cuda:10.2-base

ARG DOCKER_USER=fastai2-user
ARG BUILD=prod
ARG BUILDKIT_INLINE_CACHE=1

# Re-create non-root user in this stage
RUN useradd -ms /bin/bash $DOCKER_USER

COPY --chown=$DOCKER_USER --from=build_stage /miniconda3 /miniconda3

# Copy bash scripts
COPY ./docker/fastai2-build/entrypoint.sh /home/docker-fastai2/
COPY ./docker/fastai2-build/run_jupyter.sh /home/docker-fastai2/
RUN chmod -R a+rwx /home/docker-fastai2

# Tell docker that all future commands should run as the non-root user
USER $DOCKER_USER
WORKDIR /home

# This ensures that the fastai2 conda env will be
# loaded before the command specified on the
# command line is executed
ENTRYPOINT ["/bin/bash", "/home/docker-fastai2/entrypoint.sh"]
