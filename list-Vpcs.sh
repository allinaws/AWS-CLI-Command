#!/usr/bin/env bash
#

inputmeg=$1

#aws ec2 describe-subnets --filters "Name=vpc-id,Values=vpc-441b8523" --output table
#aws ec2 describe-subnets --filters "Name=vpc-id,Values=${vpcIds}" --output text

Usage1(){
        echo  "\033[33m 请输入相应的VpcId信息，查看详情} \033[0m"
        echo  "\033[33m USAGE: $0 {VpcId|} \033[0m"
        exit 2
}

Usage2(){
  aws ec2 describe-vpcs --filter Name=tag-key,Values=Name \
    --query 'Vpcs[*].{VpcId:VpcId,Name:Tags[?Key==`Name`]|[0].Value}' \
    --output table
}

vpcIds(){
#aws ec2 describe-subnets --filters "Name=vpc-id,Values=${vpcIds}" --output text
aws ec2 describe-subnets --filters "Name=vpc-id,Values=${inputmeg}"  \
--query 'Subnets[*].{SubnetId:SubnetId,CPRD:CidrBlock,AZ:AvailabilityZoneId,VPC:VpcId,AvailableIp:AvailableIpAddressCount,Name:Tags[?Key==`Name`]|[0].Value}' \
--output table
}

stop(){
    echo "Stopping"
}

#####



#####
case "$1" in
*)
  if [ "$1" == "" ]
  then
      Usage2
      #exit 2
      Usage1
      exit 2
  else
      vpcIds
      exit
  fi
esac
