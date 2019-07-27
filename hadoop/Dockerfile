FROM centos:centos7.4.1708

ENV HADOOP_VERSION=hadoop-3.0.0
ENV SPARK_VERSION=spark-2.4.0

RUN yum install epel-release -y \
 && yum install java-1.8.0-openjdk-devel -y \
 && yum install wget -y

# RUN yum install which -y
# RUN export JAVA_HOME=$(readlink -f $(which javac)) \
# && export JAVA_HOME=${JAVA_HOME%"/bin/javac"}
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.212.b04-0.el7_6.x86_64

# Install Hadoop
RUN wget https://archive.apache.org/dist/hadoop/common/${HADOOP_VERSION}/${HADOOP_VERSION}.tar.gz
RUN tar -xvf ${HADOOP_VERSION}.tar.gz \
 && mv ${HADOOP_VERSION} /opt/hadoop \
 && rm ${HADOOP_VERSION}.tar.gz
ENV HADOOP_HOME /opt/hadoop

# Install Spark
RUN  wget https://archive.apache.org/dist/spark/${SPARK_VERSION}/${SPARK_VERSION}-bin-without-hadoop.tgz
RUN tar -xvf ${SPARK_VERSION}-bin-without-hadoop.tgz \
 && mv ${SPARK_VERSION}-bin-without-hadoop /opt/spark \
 && rm ${SPARK_VERSION}-bin-without-hadoop.tgz
ENV SPARK_HOME /opt/spark

ADD conf/core-site.xml /opt/hadoop/etc/hadoop/
ADD conf/hdfs-site.xml /opt/hadoop/etc/hadoop/
ADD conf/yarn-site.xml /opt/hadoop/etc/hadoop/
ADD conf/mapred-site.xml /opt/hadoop/etc/hadoop/

RUN mkdir -p /data/hdfs/nn \
 && mkdir -p /data/hdfs/dn \
 && mkdir -p /data/yarn/data \
 && mkdir -p /data/yarn/logs \
 && $HADOOP_HOME/bin/hdfs namenode -format hadoop-dfs

ENV HDFS_NAMENODE_USER root
ENV HDFS_DATANODE_USER root
ENV HDFS_SECONDARYNAMENODE_USER root
ENV YARN_RESOURCEMANAGER_USER root
ENV YARN_NODEMANAGER_USER root

RUN echo HADOOP_HOME=$HADOOP_HOME >> /root/.bashrc
RUN echo JAVA_HOME=$JAVA_HOME >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh

RUN echo PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$SPARK_HOME/bin:$PATH >> /env.sh
RUN echo "export LD_LIBRARY_PATH=$HADOOP_HOME/lib/native:$LD_LIBRARY_PATH" >> /env.sh
RUN echo "export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop" >> /env.sh
RUN echo "export SPARK_DIST_CLASSPATH=\$(hadoop classpath)" >> /env.sh
RUN echo "export SPARK_HOME=$SPARK_HOME" >> /env.sh
RUN echo ". /env.sh" >> /root/.bashrc
RUN echo ". /env.sh" >> /root/.profile

RUN chmod +x /env.sh

# setup ssh
RUN yum install -y openssh-server
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''
RUN echo root:password | chpasswd

# start everything
RUN echo "/opt/hadoop/bin/hdfs --daemon start namenode" >> /entrypoint.sh
RUN echo "sleep 5" >> /entrypoint.sh
RUN echo "/opt/hadoop/bin/hdfs --daemon start datanode" >> /entrypoint.sh
RUN echo "/opt/hadoop/bin/yarn --daemon start nodemanager" >> /entrypoint.sh
RUN echo "/opt/hadoop/bin/yarn --daemon start resourcemanager" >> /entrypoint.sh
RUN echo "/opt/hadoop/bin/mapred --daemon start historyserver" >> /entrypoint.sh
RUN echo "/usr/sbin/sshd -D" >> /entrypoint.sh

EXPOSE 9870
EXPOSE 9864
EXPOSE 8088
EXPOSE 8042
EXPOSE 19888

RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
