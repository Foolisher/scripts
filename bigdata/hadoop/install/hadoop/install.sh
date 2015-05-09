#!/usr/bin/env bash


#######################################################################
export HADOOP_HOME=~/hadoop-tmp-home

export MASTERS='wg-mac'
export SLAVES='wg-linux'
#######################################################################



if [ $# -eq 0 ];then
	note="Usage: $0 <master_host> [data_node1 ... data_noden]"
	echo -e "\033[31;1m$note\033[m"
	exit 1
fi

hadoop_tar_file=`ls | grep hadoop-.*tar.*`
hadoop_file=`echo $hadoop_tar_file | sed 's/\.tar.*//g'`
tar -xf $hadoop_tar_file -C $HOME

ln -s $HOME/$hadoop_file $HADOOP_HOME

if [ -z '`grep "HIVE_HOME"  $HOME/.bashrc`' ];then
	echo "" >> ~/.bashrc
	echo "export HADOOP_HOME=$HADOOP_HOME" >> $HOME/.bashrc
	echo "export PATH=$""HADOOP_HOME/bin:$""PATH" >> $HOME/.bashrc
	. $HOME/.bashrc
fi

cp -r conf/* $HADOOP_HOME/etc/hadoop/
sed -i "" -e "s/HOST_NAME/$1/g" $HADOOP_HOME/etc/hadoop/*

echo -e $MASTERS > $HADOOP_HOME/etc/hadoop/masters
echo -e $SLAVES > $HADOOP_HOME/etc/hadoop/slaves
