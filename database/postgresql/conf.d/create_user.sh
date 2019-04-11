#!/bin/bash

source postgresql.conf
# 创建配置文件
echo "username=$1"
username=$1
echo "$(date) user=$username " >> history

rm -f $username.txt
touch $username.txt


# 用户名
echo "user=postgres" >> $username.txt

# 生成容器别名和存储卷名，保持关联
function docker_volume
{
	j=0;
	for i in {a..z};do array[$j]=$i;j=$(($j+1));done
	for i in {A..Z};do array[$j]=$i;j=$(($j+1));done
	for i in {0..9};do array[$j]=$i;j=$(($j+1));done
	for ((i=0;i<4;i++));do strs="$strs${array[$(($RANDOM%$j))]}"; done;
	echo "docker_name=$username"_postgresql_"$strs" >> $username.txt
		echo "docker_name: $username"_postgresql_"$strs" >> history
		echo "volume_name=db_$strs" >> $username.txt
		echo "volume_name: db_$strs" >> history
}
echo -e `docker_volume`


# 生成随机密码
function randStr
{
	j=0;
	for i in {0..9};do array[$j]=$i;j=$(($j+1));done
	for i in {a..z};do array[$j]=$i;j=$(($j+1));done
	for i in {A..Z};do array[$j]=$i;j=$(($j+1));done
	for ((i=0;i<10;i++));do strs="$strs${array[$(($RANDOM%$j))]}"; done;
		echo "password=$strs" >> $username.txt
		echo "password: $strs" >> history
}
echo `randStr`


# 生成随机端口
function rand(){
    min=$1
    max=$(($2-$min+1))
    num=$(($RANDOM+1000000000)) #添加一个10位的数再求余
    echo $(($num%$max+$min))
}

port=$(rand 50000 58000)
echo "port=$port" >> $username.txt
echo "prot: $port" >> history
echo "" >> history
echo "创建"$username"的配置文件成功"
