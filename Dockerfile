FROM debian:jessie
RUN apt-get update && \
    apt-get install -y valgrind
COPY bin/rdkafka-example /bin/rdkafka-example
