#!/bin/bash
# AWSCLI CREATE NETWORK RESOUCE
###########################
# account: Globle
# region ap-northeast-1
#
#
###########################


#VPC CIDR
CIDR='10.0.0.0/16'
SUBNETS_1A='10.0.1.0/24'
SUBNETS_2B='10.0.2.0/24'
SUBNETS_3C='10.0.3.0/24'

#create vpc
VpcId(){
  aws ec2 create-vpc --cidr-block ${CIDR}
}

#create subnet
SubnetIds(){
  aws ec2 create-subnet --vpc-id vpc-a01106c2 --availability-zone ap-northeast-1a --availability-zone-id apne1-az4 --cidr-block ${SUBNETS_1A}
  aws ec2 create-subnet --vpc-id vpc-a01106c2 --availability-zone ap-northeast-1c --availability-zone-id apne1-az1 --cidr-block ${SUBNETS_2B}
  aws ec2 create-subnet --vpc-id vpc-a01106c2 --availability-zone ap-northeast-1d --availability-zone-id apne1-az2 --cidr-block ${SUBNETS_3C}
}

azIds1A(){

}






#create route
RouteIds(){

}



#################
VpcID
