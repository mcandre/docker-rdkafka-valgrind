FROM debian:jessie
RUN apt-get update && \
    apt-get install -y valgrind
COPY bin/rdkafka-example /bin/rdkafka-example
COPY rdkafka.supp /rdkafka.supp

ENTRYPOINT ["/usr/bin/valgrind"]
CMD ["--track-origins=yes", "--gen-suppressions=all", "--suppressions=/rdkafka.supp", "/bin/rdkafka-example"]
