## 查看所在区域

```
aws configure get region
```

## 查看用户

```
aws sts get-caller-identity
```

## 查看所有region

```shell
aws ec2 describe-regions --output table
aws ec2 describe-regions --all-regions

➜  ~ aws ec2 describe-regions --output table
---------------------------------------------------------------------------------
|                                DescribeRegions                                |
+-------------------------------------------------------------------------------+
||                                   Regions                                   ||
|+-----------------------------------+-----------------------+-----------------+|
||             Endpoint              |      OptInStatus      |   RegionName    ||
|+-----------------------------------+-----------------------+-----------------+|
||  ec2.eu-north-1.amazonaws.com     |  opt-in-not-required  |  eu-north-1     ||
||  ec2.ap-south-1.amazonaws.com     |  opt-in-not-required  |  ap-south-1     ||
||  ec2.eu-west-3.amazonaws.com      |  opt-in-not-required  |  eu-west-3      ||
||  ec2.eu-west-2.amazonaws.com      |  opt-in-not-required  |  eu-west-2      ||
||  ec2.eu-west-1.amazonaws.com      |  opt-in-not-required  |  eu-west-1      ||
||  ec2.ap-northeast-3.amazonaws.com |  opt-in-not-required  |  ap-northeast-3 ||
||  ec2.ap-northeast-2.amazonaws.com |  opt-in-not-required  |  ap-northeast-2 ||
||  ec2.ap-northeast-1.amazonaws.com |  opt-in-not-required  |  ap-northeast-1 ||
||  ec2.sa-east-1.amazonaws.com      |  opt-in-not-required  |  sa-east-1      ||
||  ec2.ca-central-1.amazonaws.com   |  opt-in-not-required  |  ca-central-1   ||
||  ec2.ap-east-1.amazonaws.com      |  opted-in             |  ap-east-1      ||
||  ec2.ap-southeast-1.amazonaws.com |  opt-in-not-required  |  ap-southeast-1 ||
||  ec2.ap-southeast-2.amazonaws.com |  opt-in-not-required  |  ap-southeast-2 ||
||  ec2.eu-central-1.amazonaws.com   |  opt-in-not-required  |  eu-central-1   ||
||  ec2.us-east-1.amazonaws.com      |  opt-in-not-required  |  us-east-1      ||
||  ec2.us-east-2.amazonaws.com      |  opt-in-not-required  |  us-east-2      ||
||  ec2.us-west-1.amazonaws.com      |  opt-in-not-required  |  us-west-1      ||
||  ec2.us-west-2.amazonaws.com      |  opt-in-not-required  |  us-west-2      ||
|+-----------------------------------+-----------------------+-----------------+|
```

## 查看特定区域的可用区

```shell
➜  ~ aws ec2 describe-availability-zones --output table --region ap-northeast-1
-------------------------------------------------
|           DescribeAvailabilityZones           |
+-----------------------------------------------+
||              AvailabilityZones              ||
|+---------------------+-----------------------+|
||  GroupName          |  ap-northeast-1       ||
||  NetworkBorderGroup |  ap-northeast-1       ||
||  OptInStatus        |  opt-in-not-required  ||
||  RegionName         |  ap-northeast-1       ||
||  State              |  available            ||
||  ZoneId             |  apne1-az4            ||
||  ZoneName           |  ap-northeast-1a      ||
||  ZoneType           |  availability-zone    ||
|+---------------------+-----------------------+|
||              AvailabilityZones              ||
|+---------------------+-----------------------+|
||  GroupName          |  ap-northeast-1       ||
||  NetworkBorderGroup |  ap-northeast-1       ||
||  OptInStatus        |  opt-in-not-required  ||
||  RegionName         |  ap-northeast-1       ||
||  State              |  available            ||
||  ZoneId             |  apne1-az1            ||
||  ZoneName           |  ap-northeast-1c      ||
||  ZoneType           |  availability-zone    ||
|+---------------------+-----------------------+|
||              AvailabilityZones              ||
|+---------------------+-----------------------+|
||  GroupName          |  ap-northeast-1       ||
||  NetworkBorderGroup |  ap-northeast-1       ||
||  OptInStatus        |  opt-in-not-required  ||
||  RegionName         |  ap-northeast-1       ||
||  State              |  available            ||
||  ZoneId             |  apne1-az2            ||
||  ZoneName           |  ap-northeast-1d      ||
||  ZoneType           |  availability-zone    ||
|+---------------------+-----------------------+|
```

