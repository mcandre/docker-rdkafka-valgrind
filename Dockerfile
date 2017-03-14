FROM alpine:3.5
RUN apk add -U valgrind
COPY bin/rdkafka-example /bin/rdkafka-example
