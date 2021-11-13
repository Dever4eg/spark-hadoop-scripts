if [ ! -d "$(hdfs getconf -confKey hadoop.tmp.dir)/dfs/name/current" ]; then
  "$HADOOP_HOME"/bin/hdfs namenode -format -force
fi

"$HADOOP_HOME"/bin/hdfs namenode
