#!/usr/bin/env bash


cd /Users/wanggen/workspace
scp admin@mysql001:/var/log/nginx/groupon/groupon-web-access.log ./


create table groupon_web_access_log
	(ip string, datetime TIMESTAMP, url string, user_agent string)
row format delimited fields terminated by ',';

load data local  inpath '/usr/dev/workspace/scripts/bigdata/hive/result.txt' overwrite into table groupon_web_access_log;

