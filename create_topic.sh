#/usr/bin/env bash

set -e

ZK_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' zookeeper)
TOPIC=${1:-test}
PARTITIONS=${2:-1}
REPLICATION=${3:-1}

docker run --rm ches/kafka kafka-topics.sh --create --topic $TOPIC --replication-factor $REPLICATION --partitions $PARTITIONS --zookeeper $ZK_IP:2181

