#!/bin/sh

#  Script.sh
#  LoginOC
#
#  Created by 于鸿鹏 on 2020/3/24.
#  Copyright © 2020 HongpengYu. All rights reserved.

#!/bin/sh
#echo "External Build Tool"
#echo "Yes, it worked!" >> ./ip.txt
#
#INFOPLIST="${TARGET_BUILD_DIR}/${INFOPLIST_PATH}"
#echo $INFOPLIST >> ip.txt
#echo "writing to $INFOPLIST" PLISTCMD="Add :SERVER_IP string $(ifconfig | grep inet\ | grep -v 127.0 | head -1 | cut -d " " -f 2)"

#echo -n "$INFOPLIST" | xargs -0 /usr/libexec/PlistBuddy -c "$PLISTCMD" || true PLISTCMD="Set :SERVER_IP $(ifconfig | grep inet\ | grep -v 127.0 | head -1 | cut -d " " -f 2)"

#echo -n "$INFOPLIST" | xargs -0 /usr/libexec/PlistBuddy -c "$PLISTCMD" || true
#
#
##获取ip
#ip a s | grep -w "inet" | awk 'NR==2{ print $2 }' | awk -F/ '{ print $1 }'  > ip.txt

#path=`pwd`
ip=`ifconfig | grep inet\ | grep -v 127.0 | grep -v 0.0.0.0| head -1 | cut -d " " -f 2`

echo $ip >> /Users/yuhongpeng/development/Login/LoginOC/Resource/ip.txt
