

NOTE=`cat <<EOF
 Usage: doop [-fmt or -nn or -dn] <master ip>
         -fmt: means namenode format
         -nn : to start namenode
         -dn : to start datanode
         'master ip'(required): to assign the master hadoop machine
EOF`

if [ $# -ne 2 ]; then
 echo -e "\033[1m$NOTE\033[m"
 exit 1
fi


if [ "$1" != "--fmt" ] && [ "$1" != "-fmt" ]; then
 export TAG=$1
fi

ROOT=/home/`whoami`/hadoopdocker-$2

docker run --name hadoop-$2$1 -it --net=host --rm -P \
	-v $ROOT/hdfs:/usr/local/hadoop/hdfs  \
	-v $ROOT/logs${TAG}:/usr/local/hadoop/logs  \
	-v $ROOT/tmp:/usr/local/hadoop/tmp    \
	-v $ROOT/hadoop-root:/tmp/hadoop-root \
	-v /usr/local/hive:/usr/local/hive \
	-v /usr/local/sqoop:/usr/local/sqoop \
	-e HIVE_HOME '/usr/local/hive' -e PATH '/usr/local/hive/bin:$PATH' \
	-e SQOOP_HOME '/usr/local/sqoop' -e PATH '/usr/local/sqoop/bin:$PATH' \
	   terminus/hadoop:2.6.0 /bin/bash /root/bootstrap.sh $@ 
 


