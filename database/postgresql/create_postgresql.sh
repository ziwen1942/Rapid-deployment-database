#! /bin/bash
# author: ziwen

source conf.d/postgresql.conf
source conf.d/$1.txt

if [ "create" == $2 ]
then 
    docker rm -f $docker_name
    docker run --name=$docker_name -p $port:5432 -e POSTGRES_PASSWORD=$password -d $postgre_v
    echo "      启动postgresql镜像$docker_name 成功
            用户：$1
            IP: $hostname
            port: $port
            user: $user
            password: $password"

elif [ "stop" == $2 ]
then
    docker stop $docker_name
    echo "停止postgresql镜像$docker_name 成功"

elif [ "delete" == $2 ]
then
    docker stop $docker_name
    docker rm $docker_name
    echo "删除postgresql镜像$docker_name 成功"

else
    echo "参数错误"
fi
