FROM ubuntu:20.04

ARG SPARK_VERSION="3.2.0"
ARG SPARK_HADOOP_VERSION="3.2"

RUN apt update && apt-get install -y \
    ssh curl vim default-jdk && \
    rm -rf /var/lib/apt/lists/*

RUN export ARCHIVE_FILE_NAME="spark-$SPARK_VERSION-bin-hadoop$SPARK_HADOOP_VERSION" && \
    curl -O -L -k "https://dlcdn.apache.org/spark/spark-$SPARK_VERSION/$ARCHIVE_FILE_NAME.tgz" && \
    ls $ARCHIVE_FILE_NAME.tgz && \
    tar -zxvf $ARCHIVE_FILE_NAME.tgz -C /opt && \
    rm -f $ARCHIVE_FILE_NAME* && \
    ln -s /opt/spark* /opt/spark

ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
