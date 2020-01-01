# GitHub Actions Runner Docker images

![Docker Pulls](https://img.shields.io/docker/pulls/zerosuxx/github-actions-runner) ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/zerosuxx/github-actions-runner)

`zerosuxx/github-actions-runner:latest` is image that can be used to run GitHub Runner in container.

## Usage with docker

`docker run -d --rm -e "RUNNER_REPOSITORY_URL=$RUNNER_REPOSITORY_URL" -e "RUNNER_TOKEN=$RUNNER_TOKEN" zerosuxx/github-actions-runner:latest`

## Usage with docker-compose

`RUNNER_REPOSITORY_URL=$RUNNER_REPOSITORY_URL RUNNER_TOKEN=$RUNNER_TOKEN docker-compose up -d`

## Environment variables

The following environment variables allows you to control the configuration parameters.

| Name | Description | Default value |
|------|---------------|-------------|
| RUNNER_REPOSITORY_URL | The runner will be linked to this repository URL | Required |
| RUNNER_TOKEN | Access Token provided by GitHub | Required
| RUNNER_WORK_DIRECTORY | Runner's work directory | `"_work"`
| RUNNER_NAME | Name of the runner displayed in the GitHub UI | Hostname of the container

https://help.github.com/en/actions/automating-your-workflow-with-github-actions/adding-self-hosted-runners