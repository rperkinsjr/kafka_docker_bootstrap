#!/usr/bin/env bash

set -e

ZK_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' zookeeper)
TOPIC=${1:-test}

docker run --rm --interactive ches/kafka kafka-console-consumer.sh --topic $TOPIC --from-beginning --zookeeper $ZK_IP:2181

