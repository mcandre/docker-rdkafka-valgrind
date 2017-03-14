#!/bin/sh

build_bot_dir="$(dirname $0)"

docker build -t mcandre/docker-rdkafka-example-build-bot "$build_bot_dir"
