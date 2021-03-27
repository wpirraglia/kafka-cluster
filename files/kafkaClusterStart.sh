#!/bin/bash

envsubst < /zookeeper/zookeeper_id.conf > /zookeeper/data/myid
envsubst < /kafka/default_kafka.conf > /kafka/config/server.properties
/zookeeper/bin/zkServer.sh start
/kafka/bin/kafka-server-start.sh /kafka/config/server.properties
