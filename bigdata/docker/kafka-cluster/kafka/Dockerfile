
FROM terminus/java7

ENV KAFKA kafka_2.11-0.8.2.0

ADD $KAFKA.tgz /opt/ 

ENV KAFKA_HOME /opt/$KAFKA

VOLUME ["/opt/$KAFKA/logs", "/tmp/$KAFKA"]

RUN chmod a+rw /opt/$KAFKA/logs
RUN chmod a+rw /tmp/$KAFKA

ADD run.sh /root/run.sh
CMD /root/run.sh 

