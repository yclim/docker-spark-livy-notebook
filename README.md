
# Docker Spark Livy Notebook

Setup pseudo-distributed Mode hadoop, spark, livy and jupyterhub notebook (w/ sparkmagic) on docker

# Quickstart
```
./buildall.sh
docker-compose up -d
``` 

- jupyterhub notebook: http://localhost:8000 (login myuser/password)
- livy: http://localhost:18998
- namenode: http://localhost:9870
- datanode: ttp://localhost:9864
- resourcemanger: ttp://localhost:8088
- nodemanager: ttp://localhost:8042
- jobhistory: ttp://localhost:19888
