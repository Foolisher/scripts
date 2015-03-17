
FROM terminus/java7

WORKDIR /usr/local
ADD hadoop-2.6.0.tar.gz /usr/local/
RUN ln -s hadoop-2.6.0 hadoop
RUN mkdir /usr/local/hadoop/conf && cp /usr/local/hadoop/etc/hadoop/* /usr/local/hadoop/conf

ENV HADOOP_HOME 	/usr/local/hadoop
ENV HADOOP_PREFIX 	/usr/local/hadoop
ENV HADOOP_COMMON_HOME  /usr/local/hadoop
ENV HADOOP_HDFS_HOME 	/usr/local/hadoop
ENV HADOOP_MAPRED_HOME 	/usr/local/hadoop
ENV HADOOP_YARN_HOME 	/usr/local/hadoop
ENV HADOOP_CONF_DIR 	/usr/local/hadoop/conf
ENV YARN_CONF_DIR 	$HADOOP_PREFIX/conf

ADD core-site.xml 	$HADOOP_HOME/conf/
ADD hdfs-site.xml 	$HADOOP_HOME/conf/
ADD mapred-site.xml 	$HADOOP_HOME/conf/
ADD yarn-site.xml 	$HADOOP_HOME/conf/
RUN echo "" > $HADOOP_HOME/conf/slaves


ADD bootstrap.sh 	/root/bootstrap.sh
RUN chown root:root 	/root/bootstrap.sh
RUN chmod a+x 		/root/bootstrap.sh
ENV BOOTSTRAP 		/root/bootstrap.sh

RUN chmod a+x		$HADOOP_PREFIX/conf/*.sh

VOLUME ["/usr/local/hadoop/logs", "/usr/local/hadoop/hdfs", "/usr/local/hadoop/tmp", "/tmp/hadoop-root"]

EXPOSE 50020 50090 50070 50010 50075 8031 8032 8033 8040 8042 49707 8088 8030 9000

