#!/bin/bash

[ ! -d "$SQOOP_HOME" ] && [ ! -f ./bin/sqoop ] && echo -e "\033[32;1mNot ENV:SQOOP_HOME found!\033[m" && exit 0;

[ ! -d "$SQOOP_HOME" ] && export PATH=./bin:$PATH || export PATH=${SQOOP_HOME}/bin:$PATH

sqoop

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
    -m 1 \
    --fields-terminated-by  ',' \
    --hive-delims-replacement ' ' \
    --incremental append \
    --check-column id \
    --last-value 0 ;

done
