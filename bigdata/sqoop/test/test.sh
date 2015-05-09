#!/usr/bin/env bash


curl 'wg-mac:9005/sql'\
      -d'{
          "sql":"select max(id) id from ecp_orders where date=\"2015-04-13\"",
          "job_id": "${date}"
          }'


curl 'wg-mac:9005/sql'\
      -d'{
          "sql":"select max(datetime) datetime,count(1) num from groupon_web_access_log",
          "job_id": "${date}"
          }'


curl 'wg-mac:9005/sql'\
      -d'{
          "sql":"select ip,datetime from groupon_web_access_log where datetime>=\"2015-12-31 00:00:00\" limit 20",
          "job_id": "${date}"
          }'


curl 'wg-mac:9005/sql'\
      -d'{
          "sql":"select * from eco_order_items where created_at like \"2015-04-20%\" ",
          "job_id": "${date}"
          }'

