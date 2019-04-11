# Rapid-deployment-database(RDD)
> 这是使用 `shell` `docker` 编写的脚本项目，主要目的服务敏捷开发和测试,快速提供数据库  
### 文件目录结构
```
database/
├── base-start.sh
├── install-docker-ce.sh
├── install-mongodb.sh
├── install-mysql.sh
├── install-redis.sh
|—— install-postgresql.sh
├── mongo
│   ├── conf.d
│   │   ├── create_user.sh
│   │   ├── history
│   │   └── mongo.conf
│   └── create_mongo.sh
├── mysql
│   ├── conf.d
│   │   ├── create_user.sh
│   │   ├── history
│   │   └── mysql.conf
│   └── create_mysql.sh
├── postgresql
│   ├── conf.d
│   │   ├── create_user.sh
│   │   ├── history
│   │   └── postgresql.conf
│   └── create_postgresql.sh
└── redis
    ├── conf.d
    │   ├── create_user.sh
    │   ├── history
    │   └── redis.conf
    └── create_redis.sh

```
### 1.直接基于centos安装`mysql：5.7.24` `redis：5.0.3` `mongodb：4.0` `postgresql:11` 等数据库
> 使用方法  
* 赋权
chmod +x XXXX.sh
* 执行
./XXXX.sh
> 使用顺序
* 先执行`base_install.sh`对centos系统初始化
* 然后按需求安装相关数据库
* 怎么配置启动请  [百度](https://www.baidu.com)    [谷歌](https://www.google.com)    [bing](http://www.bing.com)

### 2. 使用`docker`启动相关数据库容器
> 步骤
#### 1.安装`docker-ce`
> 推荐使用database/目录下的 `install-docker-ce.sh` 脚本来安装
#### 2.切换到要使用的数据库的目录的conf.d目录下看到`create_user.sh` `XXXX.conf`
> create_user.sh用来创建相关用户信息的
``` 
./create_user.sh ziwen
会在文件夹里创建一个ziwen.txt 文件，包含随机端口，密码等信息
```

> history---> 记录用户历史信息（以防手贱）
> XXXX.conf这个是初始配置  
> 举个栗子
```

```
#### 3.启动数据库
> 切换到上级目录
> ./create_XXXX.sh $1 $2
- $1 你在上一个阶段创建的用户，这里输入*ziwen*
- $2 执行的动作
    * create 启动docker容器
    * stop 停止容器
    * delete 删除docker容器
