#!/bin/bash
set -e

if [ -z "$RUNNER_REPOSITORY_URL" ] || [ -z "$RUNNER_TOKEN" ]; then
    echo "RUNNER_REPOSITORY_URL and RUNNER_TOKEN cannot be empty"
    exit 1
fi

if [ -z "$RUNNER_NAME" ]; then
	export RUNNER_NAME="${HOSTNAME}"
fi

if [ -z "$RUNNER_WORK_DIRECTORY" ]; then
	export RUNNER_WORK_DIRECTORY="_work"
fi

bash ./config.sh \
    --url ${RUNNER_REPOSITORY_URL} \
    --token ${RUNNER_TOKEN} \
    --name ${RUNNER_NAME} \
    --work ${RUNNER_WORK_DIRECTORY}

bash ./run.sh