
FROM terminus/java7

ENV SCALA_VERSION 2.10.4
ENV CDH_VERSION cdh4
ENV SPARK_VERSION 1.2.0-bin-hadoop2.4

ENV SPARK_WORKER_PORT 8082

ENV SCALA_HOME /opt/scala-$SCALA_VERSION
ENV SPARK_HOME /opt/spark
ENV PATH $SCALA_HOME/bin:$PATH
ENV PATH $SPARK_HOME/bin:$PATH

ADD scala-$SCALA_VERSION.tgz /opt/

ADD spark-$SPARK_VERSION.tgz /opt/
RUN (cd /opt && mv spark-$SPARK_VERSION spark)
ADD log4j.properties /opt/spark/conf/

ADD start-master /opt/spark/
ADD start-worker /opt/spark/

VOLUME ["/opt/spark/logs"]

EXPOSE 4040 7077

