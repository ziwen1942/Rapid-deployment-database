# /bin/bash
# author: ziwen

# 安装postgresql数据库,版本11
# 平台centos7_X86_64
# 安装库文件
yum install https://download.postgresql.org/pub/repos/yum/11/redhat/rhel-7-x86_64/pgdg-centos11-11-2.noarch.rpm -y
# 安装客户端
yum install postgresql11 -y
# 安装服务端
yum install postgresql11-server -y
# 初始化数据库并自动启动
/usr/pgsql-11/bin/postgresql-11-setup initdb
systemctl enable postgresql-11
systemctl start postgresql-11