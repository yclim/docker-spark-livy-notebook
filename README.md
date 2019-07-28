
# Docker Spark Livy Notebook

Setup pseudo-distributed Mode hadoop, spark, livy and jupyterhub notebook (w/ sparkmagic) on docker

# Quickstart
```
./buildall.sh
docker-compose up -d
``` 

- jupyterhub notebook: http://localhost:8000 (login myuser/password)
- livy: http://localhost:8998
- namenode: http://localhost:9870
- datanode: http://localhost:9864
- resourcemanger: http://localhost:8088
- nodemanager: http://localhost:8042
- jobhistory: http://localhost:19888
