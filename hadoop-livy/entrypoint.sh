#!/bin/bash

. /env.sh
/opt/hadoop/bin/hdfs --daemon start namenode
sleep 5
/opt/hadoop/bin/hdfs --daemon start datanode
sleep 5
/opt/hadoop/bin/yarn --daemon start nodemanager
sleep 5
/opt/hadoop/bin/yarn --daemon start resourcemanager
sleep 5
/opt/hadoop/bin/mapred --daemon start historyserver
$LIVY_HOME/bin/livy-server start