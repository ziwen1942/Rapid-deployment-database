#! /bin/bash
# author: ziwen

source conf.d/mongo.conf
source conf.d/$1.txt

# $1为创建的用户  $2为何种操作
# create=创建
if [ "create" == $2 ]
then
    docker rm -f $docker_name
    docker run -idt -p $port:27017 --name $docker_name $mongo_v --bind_ip_all
    echo "	启动mongodb镜像$docker_name 成功
	用户：$1
	IP：$hostname
	port: $port
	user: $user
	password: $password"

# 停止容器运行
elif [ "stop" == $2 ]
then 
    docker stop $docker_name
    echo "停止mongodb镜像$docker_name 成功"

# 删除容器
elif [ "delete" == $2 ]
then
    docker stop $docker_name
    docker rm $docker_name
    echo "删除mongodb镜像$docker_name 成功"

else
    echo "参数错误"
fi
