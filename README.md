# :warning: This repo is a work in progress and is not ready

# Docker Containers

This repository builds various docker images relevant to projects in [fastai](https://github.com/fastai/) on a recurring schedule [defined in the appropriate workflow files](.github/workflows/).


# List of Projects And Associated Docker Images

## [fastai2](https://github.com/fastai/fastai2)

These images are built on top of [nvidia official CUDA images](https://hub.docker.com/r/nvidia/cuda/).  You can see the version of CUDA by looking at [the Dockerfile](fastai2-build/Dockerfile).  Furthermore, fastai2 is installed with [miniconda](https://docs.conda.io/en/latest/miniconda.html), as using conda is the [recommended way](https://github.com/fastai/fastai2#installing) to install fastai2 dependencies.

- [fastai2](https://hub.docker.com/repository/docker/fastdotai/fastai2).  This installs fastai2 and fastcore from pypi.

- [fastai2-dev](https://hub.docker.com/repository/docker/fastdotai/fastai2-dev): 
an editable install of fastai2 and fastcore, along with the latest release nbdev.  The editable installs for fastai and fastcore are located in `/home/docker-fastai2/fastai2` and `/home/docker-fastai2/fastcore`, respectively.

<details>
  <summary>Expand for more details</summary>

#### Tags

These images have the following available tags:

- `latest`: the most current build
- `version`: corresponds to the version of fastai2
- `SHA`: corresponds to the GITHUB SHA of this repo when the image was built.

#### Usage

If you have an Nvdia GPU that is compatible with CUDA 10 or higher, you should [install Nvidia Docker](https://github.com/NVIDIA/nvidia-docker).  After install Nvidia Docker, you will need to use the `--gpus` flag when running the container.  See the [usage](https://github.com/NVIDIA/nvidia-docker#usage) section for more details on the various arguments available. 

#### Examples:

 Run a jupyter server with all GPUs

```bash
docker run --gpus all 
```

Run a jupyter server with 2 GPUs on with an editable install

```bash
docker run --gpus '"device=1,2"'
```

Run a jupyter server with 2 GPUs on with an editable install for version fastai 0.0.22

```bash
docker run --gpus '"device=1,2"'
```

Run an interacive shell on CPUs on the latest version of fastai2

```bash
docker run -it fastdotai/fastai2:latest bash
```
</details>