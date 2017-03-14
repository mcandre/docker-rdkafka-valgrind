#!/bin/sh

top_level_src="$(sh -c "cd $(dirname $0)/.. && pwd")"

docker run -v "${top_level_src}:/src" mcandre/docker-rdkafka-example-build-bot sh -c "cd /src && make clean && make"
