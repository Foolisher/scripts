#!/usr/bin/env bash

#######################################################################
export HADOOP_HOME=~/hadoop-tmp-home
export HIVE_HOME=~/hive-tmp-home
export SQOOP_HOME=~/sqoop-tmp-home
#######################################################################


[ ! -d "$HADOOP_HOME" ] && [ ! -f "$HADOOP_HOME" ] && echo -e "\033[31;1mHADOOP_HOME not set error\033[m" && exit 1
[ ! -d "$HIVE_HOME" ] && [ ! -f "$HIVE_HOME" ] && echo -e "\033[31;1mHIVE_HOME not set error\033[m" && exit 1


sqoop_tar_file=`ls | grep sqoop-.*tar.*`
sqoop_file=`echo ${sqoop_tar_file} | sed 's/\.tar.*//g'`
tar -xf ${sqoop_tar_file} -C $HOME

ln -s $HOME/${sqoop_file} ${SQOOP_HOME}

if [ -z "`grep "SQOOP_HOME"  $HOME/.bashrc`" ];then
	echo "" >> ~/.bashrc
	echo "export SQOOP_HOME=$SQOOP_HOME" >>$HOME/.bashrc
	echo "export PATH=$""SQOOP_HOME/bin:$""PATH" >> $HOME/.bashrc
	. $HOME/.bashrc
fi

cp mysql*jar ${SQOOP_HOME}/lib/
