
# Try running example SparkPi app in yarn master mode

```

# enter bash in docker container
./ssh.sh 

 spark-submit --class org.apache.spark.examples.SparkPi \
    --master yarn \
    --deploy-mode client \
    --driver-memory 4g \
    --executor-memory 2g \
    --executor-cores 1 \
    /opt/spark/examples/jars/spark-examples*.jar \
    10
```
