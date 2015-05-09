#!/usr/bin/env bash

#./date-partitioned-import.sh tables-hour 2015-04-17

export SQOOP_HOME=/usr/local/sqoop
export HADOOP_HOME=/usr/local/hadoop
export HIVE_HOME=/usr/local/hive
[ ! -d "$SQOOP_HOME" ] && echo "SQOOP_HOME undefined" && exit 0;
export PATH=${SQOOP_HOME}/bin:$PATH

if [ $# -lt 1 ];then
 echo -e "\033[31;1mUsage: $0 <table—names-file> <date[e.g. 2015-02-23]> \033[m"
 exit
fi

export DATE=$2
for tb in `cat $1`; do
  echo -e "\033[32;1mImporting table[$tb] date[$DATE] \033[m"
  ${SQOOP_HOME}/bin/sqoop import \
    --hive-import --hive-table ${tb} \
    --connect "jdbc:mysql://10.211.55.9:3306/groupon?useUnicode=true&characterEncoding=utf-8&user=wanggen&password=wanggen" \
    --table ${tb} \
    -m 2 \
    --hive-drop-import-delims \
    --where "created_at >= '$DATE 00:00:00' and created_at <= '$DATE 23:59:59'" \
    --hive-partition-key 'date' \
    --hive-partition-value "$DATE" \
    --incremental append --check-column 'id' --last-value 233


done