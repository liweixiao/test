#!/bin/sh
myUrl="http://www.runoob.com"
# "\033[31m 红色字 \033[0m"
echo -e "我是红色的字体" | sed -r 's/(.*红色)(.*)([\])/\1 绿色 \3/'