#!/bin/sh

git clone https://github.com/edenhill/librdkafka.git /librdkafka

cd /librdkafka

git checkout -b v0.9.4-RC1 v0.9.4-RC1

./configure && make && make install
