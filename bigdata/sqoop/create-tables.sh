#!/bin/sh


if [ $# -lt 1 ] || [ -f $1 ];then
 echo -e "\033[31;1mUsage: ./$0 <tables list file> \033[m"
 exit
fi

for t in `cat $1`; do
  echo -e "\033[31;1mCreating table $t ......\033[m"
  sqoop create-hive-table \
    --connect jdbc:mysql://10.211.55.9:3306/groupon --username wanggen --password wanggen --table $t
done