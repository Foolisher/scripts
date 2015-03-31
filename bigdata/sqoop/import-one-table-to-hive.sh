#!/bin/bash

# for T in `cat tables`; do ./import-one-table-to-hive.sh $T; done;

TABLE=$1
export SQOOP_HOME=/usr/local/sqoop
export HADOOP_HOME=/usr/local/hadoop
export HIVE_HOME=/usr/local/hive
${SQOOP_HOME}/bin/sqoop import --hive-import --hive-overwrite --hive-table ${TABLE}  \
    --connect jdbc:mysql://10.211.55.9:3306/groupon --username wanggen --password wanggen \
    --table ${TABLE} \
    --delete-target-dir \
    -m 1 \
    --fields-terminated-by  ',' --escaped-by '\\' --hive-delims-replacement '' \
    --hive-overwrite \
    $2

# $2 or --create-hive-table
