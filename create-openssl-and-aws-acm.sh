#!/bin/bash

# install openssl
# yum install openssl
# 注意所在的时区，awsli角色权限

# 输入域名信息
echo -n "请输入需要生成ACM的域名":
read domain
echo $domain

# 文件存放位置
dir=/home/acm/certdir/
mkdir -p ${dir}

#
openssl genrsa -out ${dir}privaterootca.key 2048
openssl req  -new -x509 -key ${dir}privaterootca.key -sha256  -days 366 -extensions v3_ca  -out ${dir}myrootca.pem  -subj "/C=CN/ST=BeiJing/O==SYAVINGCS/CN=test"

#
openssl genrsa -out ${dir}myintermediateca.key 2048
openssl req -new -key ${dir}myintermediateca.key -sha256 -outform PEM -keyform PEM -out ${dir}myintermediateca.csr  -subj "/C=CN/ST=BeiJing/O=SYAVINGCS/CN=test"
touch ${dir}myintermediateca.cnf
echo "[ v3_ca ]" >> ${dir}myintermediateca.cnf
echo "basicConstraints = CA:true, pathlen:0" >> ${dir}myintermediateca.cnf
echo "keyUsage = cRLSign, keyCertSign" >> ${dir}myintermediateca.cnf
echo "nsCertType = sslCA, emailCA" >> ${dir}myintermediateca.cnf
openssl x509 -extfile ${dir}myintermediateca.cnf -req -in ${dir}myintermediateca.csr -sha256 -CA ${dir}myrootca.pem -CAkey ${dir}privaterootca.key -set_serial 01  -extensions v3_ca  -days 366 -out ${dir}myintermediateca.pem

#
openssl genrsa 2048 > ${dir}myserver.key
openssl req -new -key ${dir}myserver.key -outform PEM -keyform PEM  -sha256 -out ${dir}myserver.csr  -subj "/C=CN/ST=BeiJing/O=SYAVINGCS/CN=${domain}"
openssl x509 -req -in ${dir}myserver.csr -sha256 -CA ${dir}myintermediateca.pem -CAkey ${dir}myintermediateca.key -set_serial 01 -days 366 -out ${dir}myserver.pem

#
aws acm import-certificate --certificate file://${dir}myserver.pem --private-key file://${dir}myserver.key --certificate-chain file://${dir}myintermediateca.pem
