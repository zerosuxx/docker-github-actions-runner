# GitHub Actions Runner Docker images

![Docker Pulls](https://img.shields.io/docker/pulls/zerosuxx/github-actions-runner) ![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/zerosuxx/docker-github-actions-runner/build_test_push.yml?branch=master)

`zerosuxx/github-actions-runner:latest` is image that can be used to run GitHub Runner in container.

based on `ubuntu:18.04` image
pre installed apps:
 - `curl`
 - `git`
 - `jq`
 - `docker`
 - `docker-compose`

## Usage with docker

`docker run -d --rm -e "REPOSITORY=$REPOSITORY" -e "RUNNER_TOKEN=$RUNNER_TOKEN" zerosuxx/github-actions-runner:latest`

## Usage with docker-compose

`docker-compose up -d`

## Environment variables

The following environment variables allows you to control the configuration parameters.

| Name | Description | Default value |
|------|---------------|-------------|
| `REPOSITORY` | The runner will be linked to this repository (owner/package_name) | *Required* |
| `ACCESS_TOKEN` | Personal Access Token provided by GitHub | *Required* |
| `RUNNER_TOKEN` | Runner Access Token provided by GitHub | *Required* when the `ACCESS_TOKEN` is empty |
| `RUNNER_WORK_DIRECTORY` | Runner's work directory | `"_work"` |
| `RUNNER_NAME` | Name of the runner displayed in the GitHub UI | `Hostname of the container` |

https://help.github.com/en/actions/automating-your-workflow-with-github-actions/adding-self-hosted-runners
