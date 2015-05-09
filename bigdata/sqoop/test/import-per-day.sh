#!/usr/bin/env bash

kill -9 `jps | grep Sqoop | awk '{print $1}'`

for d in 10 9 8;do
	date +'%F' -d'-'"$d"' day' > .date
	DATE=`cat .date`
	./date-partitioned-import.sh $1 "$DATE"  &
done
rm .date