#! /bin/bash
# author: ziwen

# 导入配置文件
source conf.d/redis.conf
source conf.d/$1.txt

if [ "create" == $2 ]
then
    docker rm -f $docker_name
    docker run -d --restart=always --name=$docker_name -p $port:6379 $redis_v --requirepass "$password" 
    echo "启动redis镜像$docker_name 成功
	用户：$1
	IP：$hostname
	port：$port
	user：$user
        password：$password"

elif [ "stop" == $2 ]
then
    docker stop $docker_name
    echo "停止redis镜像$docker_name 成功"

elif [ "delete" == $2 ]
then
    docker stop $docker_name
    docker rm $docker_name
    echo "删除redis镜像$docker_name 成功"

else
    echo "参数错误"
fi
