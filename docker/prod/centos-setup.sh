#!/bin/sh


echo "********************************************************"
echo "setup fire construction manager";
echo "********************************************************"

yum update

yum install curl

echo "********************************************************"
echo "install docker-ce";
echo "********************************************************"

# 脚本安装
#curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun


#yum 安装

yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

yum-config-manager \
    --add-repo \
    http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

yum install docker-ce docker-ce-cli containerd.io

touch /etc/docker/daemon.json
cp /etc/docker/daemon.json /etc/docker/daemon.json.bak
echo "{\"registry-mirrors\": [\"https://f8zbtvea.mirror.aliyuncs.com\",\"http://f1361db2.m.daocloud.io\",\"http://f1361db2.m.daocloud.io\"]}" >> /etc/docker/daemon.json


systemctl daemon-reload

systemctl enable docker

systemctl start docker


echo "********************************************************"
echo "install docker Compose";
echo "********************************************************"



#TYPE: pipe install


# uninstall
#pip uninstall docker-compose


# install
#yum install epel-release
#
#yum install -y python-pip
#
#pip install --upgrade pip
#pip install docker-compose
#
#
#yum upgrade python*
#
#docker-compose version

# TYPE yum install

yum install -y epel-release
yum install docker-compose -y


# TYPE: curl install

# uninstall
#rm /usr/local/bin/docker-compose


# install
#sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#
#sudo chmod +x /usr/local/bin/docker-compose

echo "********************************************************"
echo "open firewall port";
echo "********************************************************"

mv data /home/


firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --zone=public --add-port=5200/tcp --permanent
firewall-cmd --zone=public --add-port=5201/tcp --permanent

systemctl restart firewalld

docker run  -v /home/data/db:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=p0stgr@s -e MYSQL_DATABASE=keycloak -e MYSQL_USER=keycloak -e MYSQL_PASSWORD=k@ycl0ck -e TZ=Asia/Shanghai -d  coopersoft/mariadb-min:v1


echo "setup completed!";