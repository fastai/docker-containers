![Build CI Containers](https://github.com/fastai/docker-containers/workflows/Build%20CI%20Containers/badge.svg)

# Docker Containers For fast.ai

This repository builds various docker images used for continuous integration for [fastai](https://github.com/fastai/) on a recurring schedule [defined in this repo's workflow files](.github/workflows/). You must install [Docker](https://docs.docker.com/get-docker/) before using this project.

These Docker containers are useful for testing scenarios that require reproducibility.  Some familiarity with Docker is assumed before using these containers.  For a gentle introduction to Docker, see [this blog post](https://towardsdatascience.com/how-docker-can-help-you-become-a-more-effective-data-scientist-7fc048ef91d5).


---


# Miscellaneous Resources & Tips

- Save the state of a running container by first finding the Container ID of your running container with `docker ps`.  After you have located the relevant ID, you can use [docker commit](https://docs.docker.com/engine/reference/commandline/commit/) to save the state of the container for later use.

- Mount a local directory into your Docker image so that you can access files that are genearated when you exit your container with the `-v` flag.

- Read [this blog post](https://towardsdatascience.com/how-docker-can-help-you-become-a-more-effective-data-scientist-7fc048ef91d5).

- Read [this book](https://www.manning.com/books/docker-in-action-second-edition) to dive deeper into Docker.
