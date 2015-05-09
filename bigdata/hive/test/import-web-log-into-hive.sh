#!/usr/bin/env bash


#scp admin@mysql001:/var/log/nginx/groupon/groupon-web-access.log ./
./data-import.scala

HIVE_HOME=${HIVE_HOME:='/usr/local/hive'}

$HIVE_HOME/bin/hive -e '
  drop table groupon_web_access_log;
  create table groupon_web_access_log
	  (ip string, datetime TIMESTAMP, url string, user_agent string);
  load data local  inpath "'`pwd`'/result.txt" overwrite into table groupon_web_access_log;
'



