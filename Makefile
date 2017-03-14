BIN=bin/rdkafka-example
UNAME=$(shell uname)
STATIC=

ifeq ($(UNAME), Linux)
  STATIC="-static"
endif

all: $(BIN)

$(BIN): lib/rdkafka-example.c
	mkdir -p bin
	gcc -o $(BIN) $(STATIC) lib/rdkafka-example.c -lrdkafka -lz -lpthread -lrt

clean:
	-rm -rf bin
