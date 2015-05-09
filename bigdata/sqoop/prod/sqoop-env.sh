#!/usr/bin/env bash

export SRC_HOST=wg-linux
export   SRC_DB=groupon
export     USER=wanggen
export  PASSWOR=wanggen
export  HIVE_DB=ecp

export HADOOP_HOME=/usr/local/hadoop
export   HIVE_HOME=/usr/local/hive
export  SQOOP_HOME=/usr/local/sqoop

[ ! -d "$HADOOP_HOME" ] && echo -e "\033[31;m1HADOOP_HOME undefined\033[m" && exit 1
export PATH=${HADOOP_HOME}/bin:$PATH

[ ! -d "$HIVE_HOME" ] && echo -e "\033[31;m1HIVE_HOME undefined\033[m" && exit 1
export PATH=${HIVE_HOME}/bin:$PATH

[ ! -d "$SQOOP_HOME" ] && echo -e "\033[31;m1SQOOP_HOME undefined\033[m" && exit 1
export PATH=${SQOOP_HOME}/bin:$PATH

