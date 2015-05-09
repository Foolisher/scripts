#!/bin/bash
. sqoop-env.sh

# for T in `cat tables`; do ./import.sh $T; done;  15/04/06 12:10:10

for TABLE in `cat $1`; do
  ${SQOOP_HOME}/bin/sqoop import --hive-import --hive-table ${HIVE_DB}.${TABLE}  \
    --connect "jdbc:mysql://$SRC_HOST:3306/$SRC_DB?useUnicode=true&characterEncoding=utf-8&user=$USER&password=$PASSWOR" \
    --table ${TABLE} \
    --delete-target-dir \
    -m 1 \
    --hive-drop-import-delims \
    --hive-overwrite \
    $2
  rm $TABLE.java
done

# $2 or --create-hive-table
