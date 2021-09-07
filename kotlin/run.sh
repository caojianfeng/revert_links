#!/bin/sh
DIR="$( cd "$( dirname "$0"  )" && pwd  )"

# 当前目录
cd $DIR
echo `pwd`

if [ -f "link.jar" ];then
    rm link.jar
fi

kotlinc link.kt -include-runtime  -d link.jar
java -jar link.jar 