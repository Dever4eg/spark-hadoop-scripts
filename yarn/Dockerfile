FROM ubuntu:20.04 as spark

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

FROM ubuntu:20.04

ARG HADOOP_VERSION="3.3.1"
ENV TZ=UTC

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt-get install -y \
    curl vim openjdk-8-jdk ssh && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L -O -k "https://dlcdn.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz" \
    && tar -xf hadoop-${HADOOP_VERSION}.tar.gz -C /opt && \
    rm -f hadoop-${HADOOP_VERSION}* && \
    ln -s /opt/hadoop* /opt/hadoop

RUN ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
    chmod 0600 ~/.ssh/authorized_keys

COPY --from=spark /opt/spark /opt/spark

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV SPARK_HOME /opt/spark
ENV HADOOP_CONF_DIR /opt/hadoop/etc/hadoop
ENV HADOOP_HOME /opt/hadoop

ENV PATH ${PATH}:${JAVA_HOME}/bin:${HADOOP_HOME}/bin:$SPARK_HOME/bin:$SPARK_HOME/sbin
