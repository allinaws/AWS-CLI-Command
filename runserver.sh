#!/bin/bash
## launch a default configure ec2 

ImageIds=ami-0eb2ecc002b356c08
Count=1

aws  ec2 run-instances \
--image-id ${ImageIds} \
--count ${Count} \
--instance-type m5a.large \
--key-name tokyo-global \
--security-group-ids sg-0241d1de686ce7782  \
--subnet-id subnet-ea042fa3 \
--no-associate-public-ip-address \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=test}]'
