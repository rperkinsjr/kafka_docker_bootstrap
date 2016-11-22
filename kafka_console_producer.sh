#!/usr/bin/env bash

set -e

KAFKA_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' kafka)
TOPIC=${1:-test}

echo "After container loads, type some messages followed by a newline."
docker run --rm --interactive ches/kafka kafka-console-producer.sh --topic $TOPIC --broker-list $KAFKA_IP:9092

