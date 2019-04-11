# 用于centos添加yum源和pip源
# 作者：子文
# 邮箱：2418150721@qq.com
# 添加DNS
echo "nameserver 114.114.114.114
nameserver 8.8.4.4
nameserver 223.5.5.5" >> /etc/resolv.conf
yum install wget -y

# 添加aliyun/163源，默认aliyun
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
# wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo
yum clean all
yum makecache
yum update -y
yum install vim curl git -y

# 添加pip,pip源
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
rm -rf get-pip.py
mkdir .pip
echo -e "[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple/" > ~/.pip/pip.conf

# rpm安装mysql
# wget http://repo.mysql.com/mysql57-community-release-el7-8.noarch.rpm
# rpm -ivh mysql57-community-release-el7-8.noarch.rpm
# rm -rf mysql57-community-release-el7-8.noarch.rpm
# yum -y install mysql-server
# systemctl start mysqld
# systemctl enable mysqld
# systemctl daemon-reload

# 安装python3.6.8
#yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make
#wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tar.xz
#tar -xvJf Python-3.6.8.tar.xz
#cd Python-3.6.8 && ./configure prefix=/usr/local/python3 && make && make install
#ln -s /usr/local/python3/bin/python3 /usr/bin/python3
# 设置pip3
#ll /usr/local/python3/bin/pip*
#ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3
#pip3 install --upgrade pip
#rm -rf /root/Python*
#pip3 install Django==2.0
#pip3 install pymysql==0.9.3


# 安装mysql
#yum -y install libaio
#wget https://cdn.mysql.com//Downloads/MySQL-5.7/mysql-5.7.24-1.el7.x86_64.rpm-bundle.tar
#mkdir mysql
## rpm -qa | grep -i mariadb
#rpm -e --nodeps mariadb-libs-5.5.60-1.el7_5.x86_64
#tar -xf mysql-5.7.24-1.el7.x86_64.rpm-bundle.tar -C mysql
#cd mysql 
#rpm -ivh mysql-community-common-5.7.24-1.el7.x86_64.rpm --force --nodeps
#rpm -ivh mysql-community-libs-5.7.24-1.el7.x86_64.rpm --force --nodeps
#rpm -ivh mysql-community-client-5.7.24-1.el7.x86_64.rpm --force --nodeps
#rpm -ivh mysql-community-server-5.7.24-1.el7.x86_64.rpm --force --nodeps
#systemctl start mysqld.service
#service mysqld start
#systemctl enable mysqld.service

#cd /root && rm -rf mysql*
