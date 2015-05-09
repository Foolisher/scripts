#!/bin/sh

. sqoop-env.sh

if [ $# -lt 1 ] || [ ! -f $1 ];then
 echo -e "\033[31;1mUsage: $0 <tables list file>\033[m"
 exit
fi

for _t in `cat $1`; do
  echo -e "\033[32;1mCreating hive table $_t\033[m"
  sqoop create-hive-table  \
    --connect "jdbc:mysql://${SRC_HOST}:3306/${SRC_DB}?useUnicode=true&characterEncoding=utf-8&user=${USER}&password=${PASSWOR}" \
    --table ${_t} --hive-table ${HIVE_DB}.${_t}
done