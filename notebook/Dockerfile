FROM centos:centos7.4.1708

RUN yum install epel-release -y
RUN yum install python-virtualenv -y
RUN yum install npm nodejs-legacy -y
RUN yum install python36 -y
RUN yum install python36-devel -y
RUN yum install python36-setuptools -y
RUN yum install python36-pip -y
RUN yum install gcc gcc-c++ -y
RUN yum install openssl-devel -y
# RUN virtualenv -p python36 jupyter_env
# RUN source jupyter_env/bin/activate
RUN pip3 install jupyterhub
RUN npm install -g configurable-http-proxy
RUN pip3 install notebook
RUN pip3 install sparkmagic
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension

# ENV SPARK_MAGIC_LOCATION /usr/local/lib/python3.6/site-packages
WORKDIR /usr/local/lib/python3.6/site-packages
RUN jupyter-kernelspec install sparkmagic/kernels/sparkkernel
RUN jupyter-kernelspec install sparkmagic/kernels/pysparkkernel
RUN jupyter-kernelspec install sparkmagic/kernels/sparkrkernel

RUN mkdir -p /root/.sparkmagic
ADD conf/config.json /root/.sparkmagic/config.json

ENV NOTEBOOK_USER=myuser
RUN useradd $NOTEBOOK_USER; echo password | passwd $NOTEBOOK_USER --stdin
RUN mkdir -p /home/$NOTEBOOK_USER/.sparkmagic
ADD conf/config.json /home/$NOTEBOOK_USER/.sparkmagic/config.json
RUN chown $NOTEBOOK_USER:$NOTEBOOK_USER -R /home/$NOTEBOOK_USER

EXPOSE 8000

CMD jupyterhub && sleep infinity

