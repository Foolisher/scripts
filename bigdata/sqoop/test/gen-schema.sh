#!/usr/bin/env bash

sql=''
for T in `cat tables`; do
	sql="select '\\ncreate table $T'; desc $T; $sql"
done
/usr/local/hive/bin/hive -e "$sql" > table_desc.txt
