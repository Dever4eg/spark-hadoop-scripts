# spark-hadoop-scripts

## Running in standalone mode

```shell
docker-compose exec spark-master bash
```

```shell
echo "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing" > /example.txt
```

```shell
hdfs dfs -fs hdfs://hadoop-namenode:8020 -put /example.txt /example.txt
```

```shell
spark-submit --master spark:// spark-master:7077 --class org.apache.spark.examples.JavaWordCount /opt/spark/examples/jars/spark-examples_2.12-3.2.0.jar hdfs://hadoop-namenode:8020/example.txt
```

## Running in yarn mode

```shell
dc exec hadoop-yarn bash
```

```shell
echo "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing" > /example.txt
```

```shell
hdfs dfs -fs hdfs://hadoop-namenode:8020 -put /example.txt /example.txt
```

```shell
spark-submit --master yarn --class org.apache.spark.examples.JavaWordCount /opt/spark/examples/jars/spark-examples_2.12-3.2.0.jar hdfs://hadoop-namenode:8020/example.txt
```
