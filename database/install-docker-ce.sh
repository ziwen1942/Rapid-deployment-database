#! /bin/bash
# author:ziwen
# emil:2418150721@qq.com
# 卸载旧版docker
sudo yum remove -y docker docker-common docker-selinux docker-engine
# 安装依赖项
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
# 添加阿里云镜像源
sudo yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
# 更新缓存
sudo yum makecache fast
# 安装docker
sudo yum install -y docker-ce

# 添加到开机启动
sudo systemctl enable docker
# 启动docker
sudo systemctl start docker
# 添加加速
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://mev3xqel.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker