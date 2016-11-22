#!/usr/bin/env bash

# start_kafka.sh: Spins up Zookeeper and Kafka docker containers.

set -e

# Launch Zookeeper container
docker run -d --name zookeeper -p 2181:2181 jplock/zookeeper:3.4.6

# Launch Kafka container
docker run -d --name kafka --link zookeeper:zookeeper -p 9092:9092 ches/kafka

# Obtain Docker IP
DOCKER_IP=`ifconfig en0 | grep "inet " | cut -d " " -f2`
if [[ -z "$DOCKER_IP" ]];then
  (>&2 echo "Docker IP not found!")
  exit 1
fi

echo "Connection info:"
ZK_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress}}' zookeeper)
echo "  Zookeper: $DOCKER_IP:2181"
KAFKA_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress}}' kafka)
echo "  Kafka:    $DOCKER_IP:9092"
