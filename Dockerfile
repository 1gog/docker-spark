FROM centos:7

RUN yum install -y epel-release && yum install -y vim wget curl java-1.8.0-openjdk.x86_64 && yum clean all -y 
RUN cd /opt/ && wget http://apache-mirror.rbc.ru/pub/apache/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz && tar xzf spark-2.4.3-bin-hadoop2.7.tgz && mv spark-2.4.3-bin-hadoop2.7 spark && rm -f /opt/spark-2.4.3-bin-hadoop2.7.tgz
ENV PATH=$PATH:/opt/spark/bin
