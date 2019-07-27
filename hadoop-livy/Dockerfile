FROM hadoop:latest

ENV LIVY_VERSION 0.6.0-incubating

RUN yum install unzip -y

RUN wget https://www-us.apache.org/dist/incubator/livy/${LIVY_VERSION}/apache-livy-${LIVY_VERSION}-bin.zip
RUN unzip apache-livy-${LIVY_VERSION}-bin.zip \
 && mv apache-livy-${LIVY_VERSION}-bin /opt/livy \
 && rm apache-livy-${LIVY_VERSION}-bin.zip
ENV LIVY_HOME /opt/livy

EXPOSE 8998

ADD conf/livy.conf /opt/livy/conf
ADD conf/spark-blacklist.conf /opt/livy/conf
RUN echo "$LIVY_HOME/bin/livy-server start" >> /entrypoint.sh

CMD /entrypoint.sh && sleep infinity