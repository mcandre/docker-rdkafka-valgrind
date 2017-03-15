FROM debian:jessie
COPY install-librdkafka.sh /install-librdkafka.sh
RUN apt-get update && \
    apt-get install -y git g++ libzip-dev zlib1g-dev make bash python && \
    /install-librdkafka.sh
