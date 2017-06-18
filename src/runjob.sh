#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

NUM_IT=1
if [ ! -z "$1" ]; then
    NUM_IT=$1
fi
echo "Running page rank with $NUM_IT iterations"

cd $DIR/builds
hdfs dfs -rm -r /transition
hdfs dfs -mkdir /transition
hdfs dfs -put transition.txt /transition
hdfs dfs -rm -r /output*
hdfs dfs -rm -r /pagerank*
hdfs dfs -mkdir /pagerank0
hdfs dfs -put pr.txt /pagerank0
hadoop jar pagerank.jar Driver /transition /pagerank /output $NUM_IT