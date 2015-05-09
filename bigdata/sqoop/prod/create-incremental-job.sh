#!/usr/bin/env bash

. sqoop-env.sh

if [ $# -lt 1 ];then
 echo -e "\033[31;1mUsage: $0 <table—names-file> \033[m"
 exit
fi

truncate_script = ''

for tb in `cat $1`; do
  echo -e "\033[32;1mCreat job for table[$tb] \033[m"
  sqoop job --delete job_incr_imp_${tb}
  sqoop job --create job_incr_imp_${tb} -- \
    import \
    --hive-import --hive-table ${HIVE_DB}.${tb} \
    --connect "jdbc:mysql://${SRC_HOST}:3306/${SRC_DB}?useUnicode=true&characterEncoding=utf-8&user=${USER}&password=${PASSWOR}" \
    --table ${tb} \
    -m 1 \
    --hive-drop-import-delims \
    --incremental append --check-column 'id' --last-value 0
	truncate_script="${truncate_script} truncate table ${HIVE_DB}.${tb};"
done


hive -e "$truncate_script"