#!/bin/sh
DIR="$( cd "$( dirname "$0"  )" && pwd  )"

# 当前目录
cd $DIR
echo `pwd`

if [ -f "test_link" ];then
    rm test_link
fi
xcrun swiftc -v -o test_link link.swift
./test_link