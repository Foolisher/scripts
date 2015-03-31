#!/usr/bin/env bash

echo "[`date +'%F %T'`] -- $0($@)" >> $SPARK_HOME/logs/driver.log

while [ $# -gt 0 ];do
  case $1 in
   --try-start)
     [ -z "`jps | grep SparkSubmit | awk '{print $1}'`" ] &&  $SPARK_HOME/workspace/submit.sh &
     shift
   ;;
   --restart)
     kill -9 `jps | grep SparkSubmit | awk '{print $1}'`; $SPARK_HOME/workspace/submit.sh &
     shift
   ;;
   --stop)
     kill -9 `jps | grep SparkSubmit | awk '{print $1}'`; shift
   ;;
   *)
    echo -e "\033[31;1m Options: --try-start | --restart | --stop  \033[m"
    exit
  ;;
 esac
done

