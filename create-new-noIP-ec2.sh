#!/bin/bash
## 系统为 CentOS 7
## 地区为日本东京


instance_id=$(aws  ec2 run-instances \
    --image-id ami-0053d11f74e9e7f52 \
    --count 1 \
    --instance-type t2.micro \
    --key-name WindowsOS \
    --security-group-ids sg-0241d1de686ce7782  \
    --subnet-id subnet-ea042fa3 \
    --no-associate-public-ip-address \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=lisi}]' )


eIP=$(`aws ec2 allocate-address --domain vpc`)


aws ec2 associate-address --instance-id $instance_id --allocation-id $eIP
    