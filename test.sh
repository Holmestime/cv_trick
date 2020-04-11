#!/bin/bash
#判断 字符串参数1是否包含字符串参数2
function countainStr(){
  result=$(echo $1 | grep "${2}")
  if [[ "$result" != "" ]]
  then
    return 1
  else
    return 0
  fi
}

#判断参数个数
if [ $# == 1 ]
then
    #若参数正确执行代码
    git add .
    message=$1
    git commit -m "${message}"
    git push origin master
else
    #参数错误则输出Usage
    echo '[usage]'
    echo 'gitPush [COMMIT MESSAGE]'
fi
# 如果推送远程报错
countainStr $pushResult "fatal: "
if [ $? == 1 ]
then
  echo "something error!"
else
  echo "push successfully"
fi
