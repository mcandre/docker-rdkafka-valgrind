FROM alpine:3.5
COPY install-librdkafka.sh /install-librdkafka.sh
RUN apk add -U git g++ musl-dev libzip-dev zlib-dev make bash python && \
    /install-librdkafka.sh
