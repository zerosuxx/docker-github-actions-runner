#!/bin/sh
set -e

./config.sh --url ${REPOSITORY_URL} --token ${RUNNER_TOKEN}

./run.sh
