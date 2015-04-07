#!/usr/bin/env bash

usage() {

NOTE=`cat <<EOF
 Usage: bootstrap <option>
 The option as following:
  --fmt <master ip> :namenode format with master ip
  --nn              :start a namenode
  --dn              :start a datanode 
EOF`
echo -e "\033[1m$NOTE \033[m"
}


if [ $# -lt 1 ]; then usage; exit 1; fi

service sshd start

: ${HADOOP_PREFIX:=/usr/local/hadoopa}
: ${HADOOP_HOME:=/usr/local/hadoop}
export HADOOP_CONF_DIR=$HADOOP_HOME/conf
$HADOOP_CONF_DIR/hadoop-env.sh
service sshd start


while [ $# -gt 0 ]; do
case $1 in
  --fmt|-fmt)
    shift && sed -i  s/HOST_NAME/$1/g $HADOOP_PREFIX/conf/*
    echo $1 > $HADOOP_CONF_DIR/masters
    echo -e "\033[32;1m Formatting namenode:[$1] \033[m"
    $HADOOP_PREFIX/bin/hdfs namenode -format
  ;;

  --nn|-nn)
    shift && sed -i  s/HOST_NAME/$1/g $HADOOP_PREFIX/conf/*
    echo $1 > $HADOOP_CONF_DIR/masters
    echo -e "\033[32;1m Starting namenode:[`cat $HADOOP_CONF_DIR/masters`] \033[m"
    $HADOOP_PREFIX/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR --script hdfs start namenode
    $HADOOP_PREFIX/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR start resourcemanager
    while true; do sleep 1000; done
  ;;

  --dn|-dn)
    shift && sed -i  s/HOST_NAME/$1/g $HADOOP_PREFIX/conf/*
    echo -e "\033[32;1m Starting datanode \033[m"
    $HADOOP_PREFIX/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR --script hdfs start datanode
    $HADOOP_PREFIX/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR start nodemanager
    while true; do sleep 1000; done
  ;;

  *)
    echo -e "\033[31;1mBad command:[$1]\033[m" && usage && exit 1
  ;;
esac
done




