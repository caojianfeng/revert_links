#!/bin/sh
DIR="$( cd "$( dirname "$0"  )" && pwd  )"

# 当前目录
cd $DIR
echo `pwd`

if [ -f "Links.class" ];then
    rm Links.class
fi

javac Links.java
java Links