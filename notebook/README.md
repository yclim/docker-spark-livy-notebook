# commands

```
docker build --tag jupyterhub .
docker run -it -p 8000:8000 jupyterhub:latest
```

/spark/bin/spark-submit --master spark://spark-master:7077 --deploy-mode cluster --class org.apache.spark.examples.SparkPi /spark/examples/jars/spark-examples_2.11-2.1.2-SNAPSHOT.jar 2