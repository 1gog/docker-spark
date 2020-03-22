spark 2.4.5

url: https://apache-mirror.rbc.ru/pub/apache/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz

Build image:

1. download spark tgz unpack in first image and them copy to second images, so second image not contain tgz archive
example:
```bash
FROM centos:7 
RUN curl http://spark.tgz
RUN tar -xzf spark.tgz -C /opt

FROM centos:7 
RUN mkdir -p /opt/spark-2.4.5 && ln -s /opt/spark-2.4.5 /opt/spark2
COPT --from=0 /opt/spark-2.4.5/ /opt/spar2/
```

2. second form wrote a label FROM image:tag AS label_for_tmp_image
example:
```bash 
FROM centos:7 AS spark2
RUN curl http://spark.tgz
RUN tar -xzf spark.tgz -C /opt

FROM centos:7 
RUN mkdir -p /opt/spark-2.4.5 && ln -s /opt/spark-2.4.5 /opt/spark2
COPT --from=spark2 /opt/spark-2.4.5/ /opt/spar2/
```
3. You are can use one more use case, copy file from other image

```bash
COPY --from=nginx:latest /etc/nginx/nginx.conf /nginx.conf
``` 


How to run docker image

```bash
docker run -it --rm --name spark2 -p 4040:4040  1gog/spark:2.4.5 bin/spark-shell 
```

```bash
docker run -it --rm --name spark2 -p 4040:4040  1gog/spark:2.4.5 bin/spark-submit
```

```bash
docker run -it --rm --name spark2 -p 4040:4040  1gog/spark:2.4.5 bin/pyspark
```

