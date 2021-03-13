#!/bin/bash

instance_id=$(aws ec2 run-instances -image-id ami-12345 \
    --query Reservations[].Instances[].InstanceId \
    --output text)
instance_state=$(aws ec2 describe-instances -instance-ids $instance_id \
    --query 'Reservations[].Instances[].State.Name')
while [ "$instance_state" != "running" ]
do
    sleep 1
    instance_state=$(aws ec2 describe-instances -instance-ids $instance_id \
    --query "Reservationsp[].Instances[].State.Name")
done
