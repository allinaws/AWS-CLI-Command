#!/bin/bash
#



describe-Instances(){
aws ec2 describe-instances \
--filter Name=tag-key,Values=Name \
--query 'Reservations[*].Instances[*].{Instance:InstanceId,AZ:Placement.AvailabilityZone,Name:Tags[?Key==`Name`]|[0].Value,
PubIP:PublicIpAddress,PriIP:PrivateIpAddress,AMIID:ImageId,State:State.Name,subnet:SubnetId,VPC:VpcId'} \
--output table
}


describe-Route(){
  aws ec2 describe-route-tables --route-table-ids rtb-257a9743
}


allocate-IP(){
  aws ec2 allocate-address \
      --domain vpc
}




Usage1
