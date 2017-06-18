#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

if [ ! -d "builds" ]; then
    mkdir builds
fi

cd main/java
hadoop com.sun.tools.javac.Main *.java
mv *.class $DIR/builds/
cp pr.txt $DIR/builds/
cp transition.txt $DIR/builds/
cd $DIR/builds
jar cf pagerank.jar *.class

