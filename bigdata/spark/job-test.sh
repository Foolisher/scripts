#!/usr/bin/env bash

ADDR='wg-mac:9005'

#declare -i timeout=5
#while [ ${timeout} -gt 0 ];do
#  if [ -z "`nc -z ${ADDR}`" ];then
#    echo -e "\033[31m Heartbeat for [$timeout] \033[m"
#    sleep 1
#  else
#    echo -e "\033[32;1m Server is available! \033[m"
#    timeout=5; break
#  fi
#  timeout=${timeout}-1
#done
#
#if [ ${timeout} -ne 5 ];then
#  echo -e "\033[31;1m The $ADDR is not in serving!!! \033[m"
#  exit
#fi


declare -i OFFLINE=0

declare -i n=1;
declare -i N=2


while [ $# -gt 0 ];do
  case $1 in
    -o)
      OFFLINE=1; shift;
     ;;
    -d)
      N=$2; shift 2;
     ;;
    *)
     echo  " Usage: $0 -o:not table refresh; -d:set date duration "; exit;
     ;;
  esac
done

if [ ${OFFLINE} = 0 ];then
  echo "Downloading tables..."
  /usr/local/spark/workspace/import-table.sh /usr/local/spark/workspace/tables1 >> sparkjob.log
  echo "Tables are ready"
fi

#$SPARK_HOME/driver.sh --try-start &
#sleep 10

while [ $n -lt $N ]; do
  gdate +'%F' -d'-'"$n"' day' > tttttt
  echo -e "\033[32;1m Data date:"`cat tttttt`"\033[m"
  gdate +'%F %T' >> sparkjob.log; echo "" >> sparkjob.log
  curl ${ADDR}'/job/dealsummary?sumFor='`cat tttttt`'&dataRoot=/tmp' >> sparkjob.log
  curl ${ADDR}'/job/refsummary?sumFor='`cat tttttt`'&dataRoot=/tmp'  >> sparkjob.log
  curl ${ADDR}'/job/usersummary?sumFor='`cat tttttt`'&dataRoot=/tmp'  >> sparkjob.log
  n=$n+1;
done
rm tttttt