FROM centos:7
RUN yum install -y epel-release curl wget bzip2
WORKDIR /opt
RUN wget https://apache-mirror.rbc.ru/pub/apache/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz
RUN tar xzf spark-2.4.5-bin-hadoop2.7.tgz -C /opt/


FROM centos:7
RUN yum install -y epel-release
RUN yum install -y java-1.8.0-openjdk && mkdir -p /opt/spark-2.4.5 && ln -s /opt/spark-2.4.5 /opt/spark2
COPY --from=0 /opt/spark-2.4.5-bin-hadoop2.7/ /opt/spark2/
WORKDIR /opt/spark2
CMD [ "/sbin/start-master.sh"]
