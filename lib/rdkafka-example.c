#include <librdkafka/rdkafka.h>

int main() {
  rd_kafka_conf_t *conf;
  conf = rd_kafka_conf_new();

  // ...

  rd_kafka_conf_destroy(conf);

  return 0;
}
