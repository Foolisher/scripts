#!/usr/bin/env bash
. sqoop-env.sh

mysql -h ${SRC_HOST} -u${USER} -p${PASSWOR} -D${SRC_DB} -e 'show tables' > ${SRC_DB}-tables

sed -i '' -e '/Tables_in.*/d' -e '/^[[:space:]]$/d'  ${SRC_DB}-tables