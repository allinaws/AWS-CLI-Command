# VPC CLI

## 查看VPC

```
aws ec2 describe-vpcs
```

## 查看某个VPC信息
```
aws ec2 describe-vpcs --vpc-ids vpc-bae5b5dd
```
## 创建VPC CIDR
```
aws ec2 create-vpc --cidr-block 10.0.0.0/16 
```
## 创建具有专用租赁的VPC
```
aws ec2 create-vpc --cidr-block 10.0.0.0/16 - instance-tenancy dedicated 
```
## 使用IPv6 CIDR块创建VPC
```
aws ec2 create-vpc --cidr-block 10.0.0.0/16 --amazon-provided-ipv6-cidr-block 
```
## 创建子网，并指定可用区
```
aws ec2 create-subnet --vpc-id vpc-a01106c2 --availability-zone ap-southeast-1b --availability-zone-id apse1-az2 --cidr-block 10.0.1.0/24 
```
## 查看所有子网信息
```
aws ec2 describe-subnets
```
## 查看某个VPC的子网
```
aws ec2 describe-subnets --filters "Name=vpc-id,Values=vpc-bae5b5dd"
```
## 查看VPC和子网信息
```
[root@ip-10-0-28-178 ~]# aws ec2 describe-subnets --filters "Name=vpc-id,Values=vpc-0b05c605f39280a5d"  --output text
SUBNETS False   ap-northeast-1a 25      10.0.28.128/27  False   False   available       subnet-0a822d34b9481c3b4        vpc-0b05c605f39280a5d
TAGS    Name    krf_d_sn_dmz_a
SUBNETS False   ap-northeast-1a 27      10.0.28.64/27   False   False   available       subnet-008796dfe2fc2c285        vpc-0b05c605f39280a5d
TAGS    Name    krf_d_sn_nlb_a
SUBNETS False   ap-northeast-1a 25      10.0.28.0/27    False   False   available       subnet-050e889e43536753a        vpc-0b05c605f39280a5d
TAGS    Name    krf_d_sn_inet_a
SUBNETS False   ap-northeast-1a 14      10.0.28.160/27  False   False   available       subnet-0f732e792ea6ed4d1        vpc-0b05c605f39280a5d
TAGS    Name    krf_d_sn_trust_a
SUBNETS False   ap-northeast-1c 26      10.0.28.32/27   False   False   available       subnet-0258b4692b67a20fa        vpc-0b05c605f39280a5d
TAGS    Name    krf_d_sn_dmz_c
SUBNETS False   ap-northeast-1c 27      10.0.28.96/27   False   False   available       subnet-0e0dfc088c93f352b        vpc-0b05c605f39280a5d
TAGS    Name    krf_d_sn_nlb_c
SUBNETS False   ap-northeast-1a 26      10.0.28.192/27  False   False   available       subnet-0f237bade688e5c2a        vpc-0b05c605f39280a5d
TAGS    Name    krf_d_sn_rds_a
SUBNETS False   ap-northeast-1c 27      10.0.28.224/27  False   False   available       subnet-04034bef98e81cc9d        vpc-0b05c605f39280a5d
TAGS    Name    krf_d_sn_rds_c
```
```
➜  ~ aws ec2 describe-subnets --filters "Name=vpc-id,Values=vpc-441b8523" --output table
-----------------------------------------------------------------------------------------------------
|                                          DescribeSubnets                                          |
+---------------------------------------------------------------------------------------------------+
||                                             Subnets                                             ||
|+------------------------------+------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                           ||
||  AvailabilityZone            |  ap-northeast-1a                                                 ||
||  AvailabilityZoneId          |  apne1-az4                                                       ||
||  AvailableIpAddressCount     |  4088                                                            ||
||  CidrBlock                   |  172.31.32.0/20                                                  ||
||  DefaultForAz                |  True                                                            ||
||  MapPublicIpOnLaunch         |  True                                                            ||
||  OwnerId                     |  543300565893                                                    ||
||  State                       |  available                                                       ||
||  SubnetArn                   |  arn:aws:ec2:ap-northeast-1:543300565893:subnet/subnet-ea042fa3  ||
||  SubnetId                    |  subnet-ea042fa3                                                 ||
||  VpcId                       |  vpc-441b8523                                                    ||
|+------------------------------+------------------------------------------------------------------+|
||                                             Subnets                                             ||
|+------------------------------+------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                           ||
||  AvailabilityZone            |  ap-northeast-1d                                                 ||
||  AvailabilityZoneId          |  apne1-az2                                                       ||
||  AvailableIpAddressCount     |  4090                                                            ||
||  CidrBlock                   |  172.31.16.0/20                                                  ||
||  DefaultForAz                |  True                                                            ||
||  MapPublicIpOnLaunch         |  True                                                            ||
||  OwnerId                     |  543300565893                                                    ||
||  State                       |  available                                                       ||
||  SubnetArn                   |  arn:aws:ec2:ap-northeast-1:543300565893:subnet/subnet-80043ea8  ||
||  SubnetId                    |  subnet-80043ea8                                                 ||
||  VpcId                       |  vpc-441b8523                                                    ||
|+------------------------------+------------------------------------------------------------------+|
||                                             Subnets                                             ||
|+------------------------------+------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                           ||
||  AvailabilityZone            |  ap-northeast-1c                                                 ||
||  AvailabilityZoneId          |  apne1-az1                                                       ||
||  AvailableIpAddressCount     |  4091                                                            ||
||  CidrBlock                   |  172.31.0.0/20                                                   ||
||  DefaultForAz                |  True                                                            ||
||  MapPublicIpOnLaunch         |  True                                                            ||
||  OwnerId                     |  543300565893                                                    ||
||  State                       |  available                                                       ||
||  SubnetArn                   |  arn:aws:ec2:ap-northeast-1:543300565893:subnet/subnet-f66307ad  ||
||  SubnetId                    |  subnet-f66307ad                                                 ||
||  VpcId                       |  vpc-441b8523                                                    ||
|+------------------------------+------------------------------------------------------------------+|
```

## 把igw挂到vpc上
```
aws ec2 attach-internet-gateway --vpc-id "vpc-027b355923c367c43" --internet-gateway-id "igw-080408170fc3bc93e" --region ap-northeast-1
```