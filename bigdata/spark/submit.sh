


rm /tmp/io.terminus.daos

export SPARK_HOME=/usr/local/spark

$SPARK_HOME/bin/spark-submit \
  --executor-memory 256m \
  --driver-memory 256m \
  --class io.terminus.daos.core.Bootstrap \
  $SPARK_HOME/workspace/daos/daos-all.jar \
  "local[2]" 10.0.0.8
