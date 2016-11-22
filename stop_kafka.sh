#!/usr/bin/env bash

# start_kafka.sh: Spins up Zookeeper and Kafka docker containers.

set -e

echo "Stopping instances..."
docker stop `docker ps -f name=kafka,name=zookeeper -q`

echo "Removing instances..."
docker rm `docker ps -a -f name=kafka,name=zookeeper -q`
