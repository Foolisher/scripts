#!/bin/sh

if [ $# -lt 1 ];then
 echo -e "\033[31;1mUsage: ./$0 <tables list file> \033[m"
 exit
fi

for TB in `cat tables`; do
  JOB=job_incr_import_${TB}
  sqoop job --delete ${JOB};
  echo -e "\033[31;1mCreating job $JOB ......\033[m"
  sqoop job --create  ${JOB}  -- import \
    --hive-import --hive-table ${TB} \
    --connect "jdbc:mysql://10.211.55.9:3306/groupon?useUnicode=true&characterEncoding=utf-8" \
       --username wanggen --password wanggen \
    --table ${TB} \
    --direct -m 1 \
    --fields-terminated-by  ',' --escaped-by '\\' \
    --hive-delims-replacement '' \
    --incremental append \
    --check-column id \
    --last-value 0

done