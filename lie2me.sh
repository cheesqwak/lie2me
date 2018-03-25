#!/bin/bash
nbArg=$# 

if test $nbArg -lt 1
then
     echo "USAGE   : lie2me.sh <PROJECT DIR OR PROJECT FILE>"
     echo "EXAMPLE : lie2me.sh /home/cheesqwak/project/"
     echo "EXAMPLE : lie2me.sh /home/cheesqwak/project/main.py"
     exit 1
fi

ioc1="system\("
ioc2="executable"
ioc3="call\("
ioc4="shell=True"
ioc5="popen\("
ioc6="Popen\("

#grep in code
egrep -nHr --color=always "$ioc1|$ioc2|$ioc3|$ioc4|$ioc5|$ioc6" $1

#grep in compiled code
find $1 -name "*.pyc" -exec strings {} \; |egrep --color=always "$ioc1|$ioc2|$ioc3|$ioc4|$ioc5|$ioc6" 
