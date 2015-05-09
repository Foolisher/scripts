#!/usr/bin/env bash

#./date-partitioned-import.sh tables-hour 2015-04-17

prod/sqoop-env.sh

if [ $# -lt 1 ];then
 echo -e "\033[31;1mUsage: $0 <table—names-file> <date[e.g. 2015-02-23]> \033[m"
 exit
fi

for tb in `cat $1`; do
  echo -e "\033[32;1mImporting table[$tb] date[`date +'%F'`] \033[m"
  sqoop job --delete incr_imp_${tb}
  sqoop job --create incr_imp_${tb} -- \
    import \
    --hive-import --hive-table ${tb} \
    --connect "jdbc:mysql://10.211.55.9:3306/groupon?useUnicode=true&characterEncoding=utf-8&user=wanggen&password=wanggen" \
    --table ${tb} \
    -m 2 \
    --hive-drop-import-delims \
    --where "created_at >= '$DATE 00:00:00' and created_at <= '$DATE 23:59:59'" \
    --hive-partition-key 'date' \
    --hive-partition-value "`date +'%F'`" \
    --incremental append --check-column 'id' --last-value 0


done