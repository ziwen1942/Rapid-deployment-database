# 安装mysql
yum -y install libaio
wget https://cdn.mysql.com//Downloads/MySQL-5.7/mysql-5.7.24-1.el7.x86_64.rpm-bundle.tar
mkdir mysql
#rpm -qa | grep -i mariadb
#rpm -e --nodeps mariadb-libs-5.5.60-1.el7_5.x86_64
tar -xf mysql-5.7.24-1.el7.x86_64.rpm-bundle.tar -C mysql
cd mysql
rpm -ivh mysql-community-common-5.7.24-1.el7.x86_64.rpm --force --nodeps
rpm -ivh mysql-community-libs-5.7.24-1.el7.x86_64.rpm --force --nodeps
rpm -ivh mysql-community-client-5.7.24-1.el7.x86_64.rpm --force --nodeps
rpm -ivh mysql-community-server-5.7.24-1.el7.x86_64.rpm --force --nodeps
systemctl start mysqld.service
service mysqld start
rm -rf ../mysql*
