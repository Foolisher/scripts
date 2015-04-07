#!/usr/bin/env bash


F=`date +'mysql-groupon-%F-00-00-01.sql'`
ssh admin@mysql001 scp admin@mysql002:/var/backup/groupon/$F /tmp && scp admin@mysql001:/var/backup/groupon/$F /tmp

D=`date +'%F %T'`
echo $F " recovered " "[$D]" >> data-cover.log
mysql -u wanggen -pwanggen groupon < /tmp/$F