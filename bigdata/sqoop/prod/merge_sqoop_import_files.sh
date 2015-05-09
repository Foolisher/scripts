#!/usr/bin/env bash
. sqoop-env.sh

dir=$1
from=$2
to=$3
root='/user/hive/warehouse/$HIVE_DB.db/'
mkdir ${dir}

msg="merge $root${dir}/part-m-00000_copy_{$from,$to} to ${dir}/part-m-00000_merged_${from}_${to}"
echo -e "\033[32;1m$msg \033[m"
hdfs dfs -getmerge "${root}${dir}/part-m-00000_copy_{$from,$to}"  "${dir}/part-m-00000_merged_${from}_${to}"
msg="put ${dir}/part-m-00000_merged_${from}_${to} to ${root}${dir}"
echo -e "\033[32;1m$msg\033[m"
hdfs dfs -rm "${root}${dir}/part-m-00000_merged_${from}_${to}"
#hdfs dfs -put "${dir}/part-m-00000_merged_${from}_${to}" "${root}${dir}"
# && \
#hdfs dfs -rm ${root}${dir}'/part-m-00000_copy_{$from,$to}'
