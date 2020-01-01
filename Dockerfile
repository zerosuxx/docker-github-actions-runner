FROM ubuntu:18.04

LABEL maintainer="zerosuxx@gmail.com"

ENV DEBIAN_FRONTEND="noninteractive"
ARG RUNNER_VERSION="2.163.1"

WORKDIR /actions-runner

RUN useradd github

RUN apt-get update \
    && apt-get install -y curl git

RUN curl -O https://githubassets.azureedge.net/runners/${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && chown -R github:github . \
    && ./bin/installdependencies.sh

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

USER github

ENTRYPOINT ["/entrypoint.sh"]
