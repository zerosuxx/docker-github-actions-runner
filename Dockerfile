FROM ubuntu:18.04

LABEL maintainer="zerosuxx@gmail.com"

ARG RUNNER_VERSION="2.169.1"
ARG DOCKER_COMPOSE_VERSION="1.25.5"

ENV DEBIAN_FRONTEND="noninteractive"

WORKDIR /actions-runner

RUN apt-get update \
    && apt-get install -y \
       curl \
       git \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fLO https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && rm -f ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && chown -R github:github . \
    && ./bin/installdependencies.sh

RUN curl -fsSL https://get.docker.com -o get-docker.sh \
    && sh get-docker.sh

RUN curl -fL "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
