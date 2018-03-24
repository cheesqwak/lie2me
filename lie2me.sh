#!/bin/bash
nbArg=$# 

if test $nbArg -lt 1
then
     echo "USAGE   : lie2me.sh <PROJECT DIR OR PROJECT FILE>"
     echo "EXAMPLE : lie2me.sh /home/cheesqwak/project/"
     echo "EXAMPLE : lie2me.sh /home/cheesqwak/project/main.py"
     exit 1
fi

ioc1="system("
ioc2="executable"
ioc3="call("
ioc4="shell=True"
ioc5="popen("

#grep in code
grep -nHr $ioc1 $1
grep -nHr $ioc2 $1
grep -nHr $ioc3 $1
grep -nHr $ioc4 $1
grep -nHir $ioc5 $1

#grep in compiled code
find $1 -name "*.pyc" -exec strings {} \; |grep $ioc1
find $1 -name "*.pyc" -exec strings {} \; |grep $ioc2
find $1 -name "*.pyc" -exec strings {} \; |grep $ioc3
find $1 -name "*.pyc" -exec strings {} \; |grep $ioc4
find $1 -name "*.pyc" -exec strings {} \; |grep -i $ioc5
