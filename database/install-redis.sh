#! /bin/bash

cd /opt
mkdir redis-5
yum install gcc -y
wget http://download.redis.io/releases/redis-5.0.3.tar.gz
tar -zxvf redis-5.0.3.tar.gz
rm redis-5.0.3.tar.gz
cd redis-5.0.3
make
make PREFIX=/opt/redis-5 MALLOC=libc install
# 修改redis.conf
sed -i '/bind 127.0.0.1/s/bind 127.0.0.1/#bind 127.0.0.1/g' redis.conf
# bind 127.0.0.1修改成#bind 127.0.0.1
sed -i '/protected-mode yes/s/yes/no/g' redis.conf
# protected-mode yes修改为no
sed -i '/daemonize no/s/no/yes/g' redis.conf
# daemonize no改为yes，让redis后台启动

cp /opt/redis-5.0.3/redis.conf /opt/redis-5/bin

echo "export REDIS_HOME=/opt/redis-5" >> /etc/profile
echo "export PATH=\$PATH:\$REDIS_HOME/bin" >> /etc/profile
source /etc/profile
# 启动命令

# redis-server /opt/redis-5/bin/redis.conf

