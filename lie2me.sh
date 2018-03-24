#!/bin/bash

ioc1="system("
ioc2="executable"
ioc3="call("
ioc4="shell=True"
ioc5="popen("

grep -nHr $ioc1 $1
grep -nHr $ioc2 $1
grep -nHr $ioc3 $1
grep -nHr $ioc4 $1
grep -nHir $ioc5 $1

find $1 -name "*.pyc" -exec strings {} \; |grep $ioc1
find $1 -name "*.pyc" -exec strings {} \; |grep $ioc2
find $1 -name "*.pyc" -exec strings {} \; |grep $ioc3
find $1 -name "*.pyc" -exec strings {} \; |grep $ioc4
find $1 -name "*.pyc" -exec strings {} \; |grep -i $ioc5
