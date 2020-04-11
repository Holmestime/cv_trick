#!/bin/bash
# 打印操作
function printStep(){
  echo "### 执行操作【$1】###"
}

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
#ADD

printStep "git add"
echo `git add .`

printStep "git status"
echo -e "\n"
statusResult=`git status`
echo $statusResult

# 如果没有文件修改
countainStr $statusResult "nothing to commit"
if [ $? == 1 ]
then
  echo "nothing done"
  exit
fi

# 提交内容为空
message="$1"
if [ "$message" = "" ]
then
  echo "please input your explanation"
  read $message
fi

printStep "git commit -m ${message}"
echo `git commit -m ${message}`

printStep "git push"
pushResult=`git push`

