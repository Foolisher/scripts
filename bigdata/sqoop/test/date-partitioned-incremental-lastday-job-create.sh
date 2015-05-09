#!/usr/bin/env bash

# 创建

export SQOOP_HOME=/usr/local/sqoop
export HADOOP_HOME=/usr/local/hadoop
export HIVE_HOME=/usr/local/hive
[ ! -d "$SQOOP_HOME" ] && echo "SQOOP_HOME undefined" && exit 0;
export PATH=${SQOOP_HOME}/bin:$PATH

if [ $# -lt 1 ];then
 echo -e "\033[31;1mUsage: $0 <table—names-file> <date[e.g. 2015-02-23]> \033[m"
 exit
fi

for tb in `cat $1`; do
  echo -e "\033[32;1mCreate job table[$tb] now[`date +'%F'`] \033[m"
  sqoop job --delete incr_imp_lastday_${tb};
  sqoop job --create incr_imp_lastday_${tb} -- \
    import \
    --hive-import --hive-table ${tb} \
    --connect "jdbc:mysql://10.211.55.9:3306/groupon?useUnicode=true&characterEncoding=utf-8&user=wanggen&password=wanggen" \
    --table ${tb} \
    -m 1 \
    --hive-drop-import-delims \
    --where "created_at >= '`date -d'-1 day' +'%F'` 00:00:00' and created_at <= '`date -d'-1 day' +'%F'` 23:59:59'" \
    --hive-overwrite\
    --hive-partition-key 'date' \
    --hive-partition-value "`date -d'-1 day' +'%F'`" \
    --incremental append --check-column 'id' --last-value 0


done