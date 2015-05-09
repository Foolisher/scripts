#!/usr/bin/env bash

export HADOOP_HOME=/usr/local/hadoop
export HIVE_HOME=/usr/local/hive
export SQOOP_HOME=/usr/local/sqoop

export HIVE_DB=ecp
export SRC_HOST=wg-linux
export SRC_DB=groupon
export USER=wanggen
export PASSWOR=wanggen

if [ ! -d "$HADOOP_HOME" ];then
 echo -e "\033[31;m1HADOOP_HOME undefined\033[m"
 exit 1
fi
export PATH=${HADOOP_HOME}/bin:$PATH

if [ ! -d "$HIVE_HOME" ];then
 echo -e "\033[31;m1HIVE_HOME undefined\033[m"
 exit 1
fi
export PATH=${HIVE_HOME}/bin:$PATH

if [ ! -d "$SQOOP_HOME" ];then
 echo -e "\033[31;m1SQOOP_HOME undefined\033[m"
 exit 1
fi
export PATH=${SQOOP_HOME}/bin:$PATH

