#include <librdkafka/rdkafka.h>

int main() {
  rd_kafka_conf_t *conf;
  conf = rd_kafka_conf_new();

  rd_kafka_t *rk;
  char errstr[512];

  rk = rd_kafka_new(RD_KAFKA_CONSUMER, conf, errstr, sizeof(errstr));

  // ...

  rd_kafka_destroy(rk);

  rd_kafka_conf_destroy(conf);

  return 0;
}
