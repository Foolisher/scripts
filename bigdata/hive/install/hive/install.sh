#!/usr/bin/env bash

#######################################################################
export HIVE_HOME=~/hive-tmp-home

export MYSQL_HOST=wg-linux
export MYSQL_PORT=3306
export MYSQL_DB=hive
export MYSQL_USER=wanggen
export MYSQL_PASSWORD=wanggen
export THRIFT_HOST=wg-linux
#######################################################################


hive_tar_file=`ls | grep hive-.*tar.*`
hive_file=`echo $hive_tar_file | sed 's/\.tar.*//g'`
tar -xf $hive_tar_file -C $HOME

ln -s $HOME/$hive_file $HIVE_HOME

if [ -z '`grep "HIVE_HOME"  $HOME/.bashrc`' ];then
	echo "" >> ~/.bashrc
	echo "export HIVE_HOME=$HIVE_HOME" >>$HOME/.bashrc
	echo "export PATH=$""HIVE_HOME/bin:$""PATH" >> $HOME/.bashrc
	. $HOME/.bashrc
fi


cp hive-site.xml $HIVE_HOME/conf/
cp mysql*jar $HIVE_HOME/lib

sed -i ''  -e 's/MYSQL_HOST/'$MYSQL_HOST'/' \
				-e 's/MYSQL_PORT/'$MYSQL_PORT'/' \
				-e 's/MYSQL_DB/'$MYSQL_DB'/' \
				-e 's/MYSQL_USER/'$MYSQL_USER'/' \
				-e 's/MYSQL_PASSWORD/'$MYSQL_PASSWORD'/' \
				-e 's/THRIFT_HOST/'$THRIFT_HOST'/' $HIVE_HOME/conf/hive-site.xml

