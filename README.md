spark 2.4.4

url: http://mirror.linux-ia64.org/apache/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.6.tgz

Build image:

1. download spark tgz unpack in first image and them copy to second images, so second image not contain tgz archive
example:
```bash
FROM centos:7 
RUN curl http://spark.tgz
RUN tar -xzf spark.tgz -C /opt

FROM centos:7 
RUN mkdir -p /opt/spark-2.4.4 && ln -s /opt/spark-2.4.4 /opt/spark2
COPT --from=0 /opt/spark-2.4.4/ /opt/spar2/
```

2. second form wrote a label FROM image:tag AS label_for_tmp_image
example:
```bash 
FROM centos:7 AS spark2
RUN curl http://spark.tgz
RUN tar -xzf spark.tgz -C /opt

FROM centos:7 
RUN mkdir -p /opt/spark-2.4.4 && ln -s /opt/spark-2.4.4 /opt/spark2
COPT --from=spark2 /opt/spark-2.4.4/ /opt/spar2/
```
3. You are can use one more use case, copy file from other image

```bash
COPY --from=nginx:latest /etc/nginx/nginx.conf /nginx.conf
``` 


How to run docker image

```bash
docker run -it --rm --name spark2 -p 4040:4040 -w /opt/spark2 1gog/spark:2.4.4 bin/spark-shell 
```

