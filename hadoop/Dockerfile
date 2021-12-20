FROM ubuntu:20.04

ARG HADOOP_VERSION="3.3.1"
ENV TZ=UTC

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt-get install -y \
    curl vim openjdk-8-jdk ssh pdsh && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L -O -k "https://dlcdn.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz" \
    && tar -xf hadoop-${HADOOP_VERSION}.tar.gz -C /opt && \
    rm -f hadoop-${HADOOP_VERSION}* && \
    ln -s /opt/hadoop* /opt/hadoop

RUN ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
    chmod 0600 ~/.ssh/authorized_keys

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_HOME=/opt/hadoop
ENV PATH=${PATH}:${JAVA_HOME}/bin:${HADOOP_HOME}/bin:

COPY ./namenode-entrypoint.sh /namenode-entrypoint.sh
RUN chmod +x /namenode-entrypoint.sh
