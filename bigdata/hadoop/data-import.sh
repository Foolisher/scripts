
TABLES=`cat $1`
DATE=`date +'%Y%m%d%H%M%S'`

for TABLE in ${TABLES}; do
  FILE="/tmp/$TABLE-$DATE.csv"
  echo -e "\033[32mImporting $TABLE to [$FILE] ......\033[m"
  ssh admin@mysql001 \
    mysql -h 192.168.1.15 -u <u> -p<p> -D  groupon <<EOF
     select * from ${TABLE}
     into outfile '$FILE'
     fields terminated by ','
     optionally enclosed by ''
     lines terminated by '\n'
EOF

ssh admin@mysql001 scp admin@mysql002:${FILE} ${FILE}
scp admin@mysql001:${FILE} /tmp/${TABLE}.csv
echo -e "\033[31;1m[$FILE] downloaded!\033[m"

done