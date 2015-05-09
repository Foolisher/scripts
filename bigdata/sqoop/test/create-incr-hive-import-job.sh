#!/bin/bash

export SQOOP_HOME=/usr/local/sqoop
export HADOOP_HOME=/usr/local/hadoop
export HIVE_HOME=/usr/local/hive

[ ! -d "$SQOOP_HOME" ] && echo "SQOOP_HOME undefined" && exit 0;
export PATH=${SQOOP_HOME}/bin:$PATH

if [ $# -lt 1 ];then
 echo -e "\033[31;1mUsage: $0 <table—names-file> \033[m"
 exit
fi

for tb in `cat $1`; do
  job=job_incr_import_${tb}
  sqoop job --delete ${job};
  echo -e "\033[32;1mCreating job $job ......\033[m"
  sqoop job --create  ${job}  -- import \
    --hive-import --hive-table ${tb} \
    --connect "jdbc:mysql://10.211.55.9:3306/groupon?useUnicode=true&characterEncoding=utf-8&user=wanggen&password=wanggen" \
    --table ${tb} \
    -m 2 \
    --hive-drop-import-delims \
    --incremental append \
    --check-column id \
    --last-value 0 ;

done
