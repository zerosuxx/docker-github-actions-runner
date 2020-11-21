#!/bin/bash
set -e

export RUNNER_ALLOW_RUNASROOT=1

if [ -z "$RUNNER_NAME" ]; then
    RUNNER_NAME="${HOSTNAME}"
fi

if [ -z "$RUNNER_WORK_DIRECTORY" ]; then
    RUNNER_WORK_DIRECTORY="_work"
fi

if [ ! -z "$REPOSITORY" ] && [ ! -z "$ACCESS_TOKEN" ]; then
    RUNNER_TOKEN="$(curl -XPOST -fsSL \
      -H "Authorization: token ${ACCESS_TOKEN}" \
      "https://api.github.com/repos/${REPOSITORY}/actions/runners/registration-token" \
    | jq -r '.token')"
fi

if [ -z "$RUNNER_TOKEN" ]; then
    echo "RUNNER_TOKEN cannot be empty"
    exit 1
fi

bash ./config.sh \
    --url ${RUNNER_REPOSITORY_URL} \
    --token ${RUNNER_TOKEN} \
    --name ${RUNNER_NAME} \
    --work ${RUNNER_WORK_DIRECTORY} \
    --unattended \
    --replace

bash ./run.sh
