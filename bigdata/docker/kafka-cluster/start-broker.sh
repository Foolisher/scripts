#!/bin/bash

KAFKA=kafka_2.11-0.8.2.0

help(){
content=`cat <<EOF
 Usage: start-broker.sh <options>
  options:
    --zk-connections <zk servers  default:'localhost:2181', or comma split like 'ip1:2180,ip2:2181'>
    --broker-id	     <broker id: integer number, default:1>
    --broker-host    <broker host default:ifconfig eth0>
    --broker-port    <broker port default:9092>
EOF`
echo -e '\033[1m $content \033[m'
}

HOST=$(ifconfig eth0 | awk '{if($1=="inet")print $2}' | sed 's/addr://')

ZK_CONNECTIONS=$HOST:2181
BROKER_ID=1
BROKER_HOST=$HOST
BROKER_PORT=9092

while [ $# -gt 0 ];do
  case $1 in
    --zk-connections)
      shift && ZK_CONNECTIONS=$1 && shift
    ;;
    --broker-id)
      shift && BROKER_ID=$1 && shift
    ;;
    --broker-host)
      shift && BROKER_HOST=$1 && shift
    ;;
    --broker-port)
      shift && BROKER_PORT=$1 && shift
    ;;
    *)
      echo -e "\033[31;1m Illegal param:$1 \033[m"; help; exit 0
  esac
done


echo -e "\033[32;1m Kafka broker:\n\t zk servers:$ZK_CONNECTIONS, broker id:$BROKER_ID,  broker host:$BROKER_HOST, broker port:$BROKER_PORT \033[0m"

DN="kafka-"$BROKER_HOST"-"$BROKER_PORT"-"$BROKER_ID
docker run --net=host --name $DN  -d \
  -v /opt/$DN/logs:/opt/$KAFKA/logs \
  -v /tmp/kafka-logs:/tmp/kafka-logs  \
  -p $BROKER_PORT:$BROKER_PORT \
  -e ZK_CONNECTIONS=$ZK_CONNECTIONS \
  -e BROKER_ID=$BROKER_ID \
  -e BROKER_HOST=$BROKER_HOST \
  -e BROKER_PORT=$BROKER_PORT \
  terminus/kafka


