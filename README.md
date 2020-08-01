# Docker Containers

This repository builds various docker images relevant to projects in [fastai](https://github.com/fastai/) on a recurring schedule [defined in this repo's workflow files](.github/workflows/).  Some familiarity with Docker is assumed.  For a gentle introduction to Docker, see [this blog post](https://towardsdatascience.com/how-docker-can-help-you-become-a-more-effective-data-scientist-7fc048ef91d5).

# Prerequisites

1. Install [Docker](https://docs.docker.com/get-docker/).
2. Install [Nvidia-Docker](https://github.com/NVIDIA/nvidia-docker).

# Projects

## [fastai2](https://github.com/fastai/fastai2)

![Build fastai2 images](https://github.com/fastai/docker-containers/workflows/Build%20fastai2%20images/badge.svg)

These images are built on top of [nvidia official CUDA images](https://hub.docker.com/r/nvidia/cuda/).  You can see the version of CUDA by looking at [the Dockerfile](fastai2-build/Dockerfile).  Furthermore, fastai2 is installed with [miniconda](https://docs.conda.io/en/latest/miniconda.html), as using conda is the [recommended way](https://github.com/fastai/fastai2#installing) to install fastai2 dependencies.

- **[fastdotai/fastai2](https://hub.docker.com/repository/docker/fastdotai/fastai2)**: fastai2 and fastcore, with all of thier depenendencies.
    
    Pull this image: 
    > `docker pull fastdotai/fastai2:latest`

- **[fastdotai/fastai2-dev](https://hub.docker.com/repository/docker/fastdotai/fastai2-dev)**:
has an editable install of fastai2 and fastcore and the latest release nbdev.  The editable installs for fastai and fastcore are located in `/home/docker-fastai2/fastai2` and `/home/docker-fastai2/fastcore`, respectively.

    > Pull this image: `docker pull fastdotai/fastai2-dev:latest`

Special thanks to [Giacomo Vianello](https://github.com/giacomov) for important contributions to this Docker image.

<details>
  <summary>Expand for more details</summary>

#### Tags

These following tags are available:

- `latest`: the most current build.
    > example: `docker pull fastdotai/fastai2:latest`

- `version`: corresponds to the version of fastai2 present when the container was built.
    > example: `docker pull fastdotai/fastai2:0.0.22`

- `YYYY-MM-DD`: corresponds to the date the container was built.
    > example: `docker pull fastdotai/fasta2:2020-07-31`

You can filter for the available tags by navigating to the Tags tab on the DockerHub page for either the [fastai2](https://hub.docker.com/repository/docker/fastdotai/fastai2/tags?page=1) or [fastai2-dev](https://hub.docker.com/repository/docker/fastdotai/fastai2-dev/tags?page=1) repos.

#### Usage

If you have a Nvdia GPU that is compatible with CUDA 10 or higher, you should [install Nvidia Docker](https://github.com/NVIDIA/nvidia-docker).  Afterwards, you will need to use the `--gpus` flag when running the container.  See the [usage](https://github.com/NVIDIA/nvidia-docker#usage) section for more details on the various arguments available. 

#### Examples:

- Run an interacive shell on CPUs (for example your laptop) on the latest version of fastai2:
    >  docker run -it fastdotai/fastai2 bash

- Run an interactive shell with `fastdotai/fastai2-dev` as the root user (which is helpful if you need to install things on the operating system).  Additionally, mount the current directory in your host file system to `/home/fastai-user` in the container (the `-v` flag) as well as make this the home directory (the `-w` flag).
   > docker run -it -v $PWD:/home/fastai-user -w /home/fastai-user --user root fastdotai/fastai2-dev bash

- Run an jupyter server on CPU on with an editable install
    > docker run -p 8888:8888 fastdotai/fastai2-dev jupyter notebook --ip=0.0.0.0 --no-browser --allow-root --port=8888

- Test that your GPUS are visible to pytorch from within the docker container:
    > docker run --gpus 1 fastdotai/fastai2 python -c "import torch;print(torch.cuda.is_available())"

 - Run a jupyter server with all GPUs:
    > docker run --gpus all -p 8888:8888 fastdotai/fastai2 jupyter notebook --ip=0.0.0.0 --no-browser --allow-root --port=8888
    
- Run a jupyter server with 2 GPUs on with an editable install:
    > docker run --gpus 2 -p 8888:8888 fastdotai/fastai2-dev jupyter notebook --ip=0.0.0.0 --no-browser --allow-root --port=8888

- Run a jupyter server with 2 GPUs on with an editable install for version fastai `0.0.22`:
    > docker run --gpus 2 -p 8888:8888 fastdotai/fastai2-dev:0.0.22 jupyter notebook --ip=0.0.0.0 --no-browser --allow-root --port=8888

</details>

---

## Miscelleanous Docker Tips

- Save the state of a running container by first finding the Container ID of your running container with `docker ps`.  After you have located the relevant ID, you can use [docker commit](https://docs.docker.com/engine/reference/commandline/commit/) to save the state of the container for later use.

- Mount a local directory into your Docker image so that you can access files that are genearated when you exit your container with the `-v` flag.

- Read [this blog post](https://towardsdatascience.com/how-docker-can-help-you-become-a-more-effective-data-scientist-7fc048ef91d5).

- Read [this book](https://www.manning.com/books/docker-in-action-second-edition) to dive deeper into Docker.
