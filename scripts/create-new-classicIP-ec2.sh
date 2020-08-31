#!/bin/bash
## 创建一个带有classicIP的EC2实例
## 系统为 CentOS 7
## 地区为日本东京
aws  ec2 run-instances \
--image-id ami-06a46da680048c8ae \
--count 1 \
--instance-type t2.micro \
--key-name WindowsOS \
--security-group-ids sg-0241d1de686ce7782  \
--subnet-id subnet-ea042fa3 \
--associate-public-ip-address \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=zhangsan}]'