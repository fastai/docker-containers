![Build fastai images](https://github.com/fastai/docker-containers/workflows/Build%20fastai%20images/badge.svg) ![Build nbdev images](https://github.com/fastai/docker-containers/workflows/Build%20nbdev%20images/badge.svg) ![Build nbdev docs](https://github.com/fastai/docker-containers/workflows/Build%20nbdev%20docs/badge.svg) ![Build CI Containers](https://github.com/fastai/docker-containers/workflows/Build%20CI%20Containers/badge.svg)

# Docker Containers For fast.ai

This repository builds various docker images relevant to projects in [fastai](https://github.com/fastai/) on a recurring schedule [defined in this repo's workflow files](.github/workflows/). You must install [Docker](https://docs.docker.com/get-docker/) before using this project.

These Docker containers are useful for production, testing and online services or to facilitate scenarios that require reproducibility and portability.  Some familiarity with Docker is assumed before using these containers.  For a gentle introduction to Docker, see [this blog post](https://towardsdatascience.com/how-docker-can-help-you-become-a-more-effective-data-scientist-7fc048ef91d5).

**For students taking the fast.ai courses, or for prototyping and development, fast.ai recommends using [Anaconda](https://www.anaconda.com/) in your home directory, instead of these containers.** Please consult the appropriate repository for installation instructions.

# Table of Contents

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Docker Containers For fast.ai](#docker-containers-for-fastai)
- [Table of Contents](#table-of-contents)
- [Tags](#tags)
- [Projects](#projects)
	- [fastai](#fastai)
		- [fastai Images](#fastai-images)
		- [fastai Usage](#fastai-usage)
		- [fastai Examples](#fastai-examples)
	- [nbdev](#nbdev)
		- [nbdev Images](#nbdev-images)
		- [nbdev Usage](#nbdev-usage)
		- [nbdev Examples](#nbdev-examples)
    - [nbdev-docs](#nbdev-docs)
- [Miscellaneous Resources & Tips](#miscellaneous-resources-tips)

<!-- /TOC -->

# Tags

The following tags are available for all images:

- `latest`: the most current build.
    > example: `docker pull fastdotai/fastai:latest`

- `version`: corresponds to the version of the project when the container was built.
    > example: `docker pull fastdotai/fastai:0.0.22`

- `YYYY-MM-DD`: corresponds to the date the container was built.
    > example: `docker pull fastdotai/fastai:2020-07-31`

You can filter for the available tags by navigating to the Tags tab on the appopriate [DockerHub repository](https://hub.docker.com/u/fastdotai) that corresponds to the container you are using.

# Projects

## fastai
![Build fastai images](https://github.com/fastai/docker-containers/workflows/Build%20fastai%20images/badge.svg)

Docker images for [fastai/fastai](https://github.com/fastai/fastai).  These images are built on top of [the latest pytorch image](https://hub.docker.com/r/pytorch/pytorch/). **You must install [Nvidia-Docker](https://github.com/NVIDIA/nvidia-docker) to enable gpu compatibility with these containers.**  The definition of this image can be found in [fastai-build/Dockerfile](fastai-build/Dockerfile).

### fastai Images

- **[fastdotai/fastai](https://hub.docker.com/repository/docker/fastdotai/fastai)**: fastai and fastcore, with all of their dependencies.

    Pull this image:
    > `docker pull fastdotai/fastai:latest`

- **[fastdotai/fastai-dev](https://hub.docker.com/repository/docker/fastdotai/fastai-dev)**:
has an editable install of fastai and fastcore.

    > Pull this image: `docker pull fastdotai/fastai-dev:latest`

- **[fastdotai/fastai-course](https://hub.docker.com/repository/docker/fastdotai/fastai-course)**:
is the same as `fastdotai/fastai` but additionally has the the [version 4 course notebooks](https://github.com/fastai/course-v4) and [fastbook](https://github.com/fastai/fastbook) cloned into the container.

    > Pull this image: `docker pull fastdotai/fastai-course:latest`

### fastai Usage

If you have a Nvdia GPU that is compatible with CUDA 10 or higher, you should [install Nvidia Docker](https://github.com/NVIDIA/nvidia-docker).  Afterwards, you will need to use the `--gpus` flag when running the container.  See the [usage](https://github.com/NVIDIA/nvidia-docker#usage) section for more details on the various arguments available.

These images have the default user as `root`.  However, for production use cases you may [not want to run your containers as root](https://americanexpress.io/do-not-run-dockerized-applications-as-root/).  We leave it to the end user to configure their environment to suit their needs.  You can change to a non-root user with the flag `--user 9000`, which is illustrated in the examples below.

### fastai Examples

> Note: the script `run_jupyter.sh` is a convenience script that is located in the home directory of these containers. This allows you to quickly run a jupyter server. The script has the command `jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root --no-browser`.

- Run an interactive shell on CPUs (for example your laptop) on the latest version of fastai:
    >  docker run -it fastdotai/fastai bash

- Run an interactive shell with `fastdotai/fastai-dev` and mount the current directory from your host file system to `/home/fastai-user` in the container (the `-v` flag) as well as make this the home directory (the `-w` flag) in the container.
   > docker run -it -v $PWD:/home/fastai-user -w /home/fastai-user fastdotai/fastai-dev bash

- Run a jupyter server on CPU with an editable install on port 8888
    > docker run -p 8888:8888 fastdotai/fastai-dev ./run_jupyter.sh

- Test that your GPUs are visible to pytorch from within the docker container:
    > docker run --gpus 1 fastdotai/fastai python -c "import torch;print(torch.cuda.is_available())"

- Run the same command as above as a non-root user:
    >  docker run -it --user 9000 another/tag python -c "import torch;print(torch.cuda.is_available())"

 - Run a jupyter server with all GPUs:
    > docker run --gpus all -p 8888:8888 fastdotai/fastai ./run_jupyter.sh

- Run a jupyter server with 2 GPUs on with an editable install:
    > docker run --gpus 2 -p 8888:8888 fastdotai/fastai-dev ./run_jupyter.sh

- Run a jupyter server with 2 GPUs on with an editable install for version fastai `0.0.22`:
    > docker run --gpus 2 -p 8888:8888 fastdotai/fastai-dev:0.0.22 ./run_jupyter.sh

## nbdev

![Build nbdev images](https://github.com/fastai/docker-containers/workflows/Build%20nbdev%20images/badge.svg)

Docker images for [nbdev](https://github.com/fastai/nbdev).  These containers are built using [repo2docker](https://repo2docker.readthedocs.io/en/latest/index.html), and come bundled working Jupyter and JupyterLab. You can see how these images are built in [.github/workflows/nbdev.yaml](.github/workflows/nbdev.yaml).  The default entrypoints into these containers are Jupyter servers running on port `8888` with a user named `runner`, with a working directory of `/home/runner` in the container.

### nbdev Images

- **[fastdotai/nbdev](https://hub.docker.com/repository/docker/fastdotai/nbdev)**: an install of nbdev from the latest available version on GitHub.
    Pull this image:
    > `docker pull fastdotai/nbdev:latest`

- **[fastdotai/nbdev-dev](https://hub.docker.com/repository/docker/fastdotai/nbdev-dev)**:
has an editable install of nbdev.
    Pull this image:
    > `docker pull fastdotai/nbdev-dev:latest`

### nbdev Usage

There are two common ways to utilize this container:
   1. Serve a [Jupyter, JupyterLab or nteract](https://repo2docker.readthedocs.io/en/latest/howto/user_interface.html?highlight=jupyterlab#configure-the-user-interface) development environment.  After connecting with your browser to your running Jupyter instance you can:

        - Access JupyterLab: append `/lab` to the end of the URL like so:
            > `http(s)://<server:port>/lab`
        - Switch back to the classic notebook, add `/tree` to the URL like so:
            > `http(s)://<server:port>/tree`
        - Launch nteract from within a user session by replacing /tree with /nteract at the end of a notebook server’s URL like so:
            > `http(s)://<server:port>/nteract`
   2. Run [nbdev utilities as part of your CI](https://github.com/fastai/nbdev#using-nbdev-as-part-of-your-ci) such as `nbdev_read_nbs`, `nbdev_clean_nbs`, `nbdev_diff_nbs`, `nbdev_test_nbs`.

### nbdev Examples

- Run a Jupyter server with an editable install of nbdev locally and mount your local directory into the container.  We also bind the container port `8888` to `8888` on localhost so you can reach the Jupyter server:
    > docker run -p 8888:8888 -v $PWD:/home/runner/my_data fastdotai/nbdev-dev

- Run `nbdev_test_nbs` (in this case we are passing the -h flag to see help)
    > docker run fastdotai/nbdev nbdev_test_nbs -h

- Run `nbdev_test_nbs` on notebooks in your local directory that you mount into the container.  We set the working directory in the container to `/home/runner/my_data` where your local files are located.
    >  docker run -w /home/runner/my_data -v $PWD:/home/runner/my_data fastdotai/nbdev nbdev_test_nbs

## nbdev-docs

![Build nbdev docs](https://github.com/fastai/docker-containers/workflows/Build%20nbdev%20docs/badge.svg)

These are Jekyll based images for building docs associated with nbev.  These are used by fastai to build docs for various projects, that have all necessary gems installed.

> Pull this image: docker pull fastdotai/nbdev-docs:latest

This image can can be found on dockerhub: [fastdotai/nbdev-docs](https://hub.docker.com/repository/docker/fastdotai/nbdev-docs)

---


# Miscellaneous Resources & Tips

- Save the state of a running container by first finding the Container ID of your running container with `docker ps`.  After you have located the relevant ID, you can use [docker commit](https://docs.docker.com/engine/reference/commandline/commit/) to save the state of the container for later use.

- Mount a local directory into your Docker image so that you can access files that are genearated when you exit your container with the `-v` flag.

- Read [this blog post](https://towardsdatascience.com/how-docker-can-help-you-become-a-more-effective-data-scientist-7fc048ef91d5).

- Read [this book](https://www.manning.com/books/docker-in-action-second-edition) to dive deeper into Docker.
