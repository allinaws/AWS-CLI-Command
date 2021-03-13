#!/bin/bash

IMAGES_INFO=()

aws ec2 describe-instances \
    --filter Name=tag-key,Values=Name \
    --query 'Reservations[*].Instances[*].{Instance:InstanceId,AZ:Placement.AvailabilityZone,Name:Tags[?Key==`Name`]|[0].Value,
PubIP:PublicIpAddress,PriIP:PrivateIpAddress,AMIID:ImageId,State:State.Name,subnet:SubnetId,VPC:VpcId'} \
    --output table





    aws ec2 describe-vpcs --filter Name=tag-key,Values=Name \
    --query 'Vpcs[*].{VpcId:VpcId,Name:Tags[?Key==`Name`]|[0].Value}' \
    --output table


aws ec2 describe-subnets --filters "Name=vpc-id,Values=vpc-441b8523"  \
--query 'Subnets[*].{SubnetId:SubnetId,CPRD:CidrBlock,AZ:AvailabilityZoneId,VPC:VpcId,AvailableIp:AvailableIpAddressCount,Name:Tags[?Key==`Name`]|[0].Value}' \
--output table
