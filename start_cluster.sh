#!/bin/bash

echo "Starting manager..."
docker -H tcp://192.168.56.10:2375 swarm init --advertise-addr 192.168.56.10

echo "Retrieve manager token..."
TOKEN=$(docker -H 192.168.56.10:2375 swarm join-token -q worker)

echo "Starting node..."
docker -H tcp://192.168.56.11:2375 swarm join --token "${TOKEN}" 192.168.56.10:2377

docker -H tcp://192.168.56.10:2375 info
