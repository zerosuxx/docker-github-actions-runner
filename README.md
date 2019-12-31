# GitHub Actions Runner Docker images

`zerosuxx/github-actions-runner:latest` is image that can be used to run GitHub Runner in container.

## usages with docker

`docker run -d --rm --user "1000:1000" -e "REPOSITORY_URL=$REPOSITORY_URL" -e "RUNNER_TOKEN=$RUNNER_TOKEN" zerosuxx/github-actions-runner:latest`

## usages with docker-compose

`REPOSITORY_URL=$REPOSITORY_URL RUNNER_TOKEN=$RUNNER_TOKEN docker-compose up -d`

## required environment variables
- `REPOSITORY_URL`
- `RUNNER_TOKEN`
