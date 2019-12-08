FROM centos:7
RUN yum install -y epel-release curl wget bzip2
WORKDIR /opt
RUN wget http://mirror.linux-ia64.org/apache/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.6.tgz
RUN tar xzf spark-2.4.4-bin-hadoop2.6.tgz -C /opt/


FROM centos:7
RUN yum install -y epel-release
RUN yum install -y java-1.8.0-openjdk && mkdir -p /opt/spark-2.4.4 && ln -s /opt/spark-2.4.4 /opt/spark2
COPY --from=0 /opt/spark-2.4.4-bin-hadoop2.6/ /opt/spark2/
WORKDIR /opt/spark2
CMD [ "/bin/bash" ]
