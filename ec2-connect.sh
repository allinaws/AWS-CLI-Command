#!/bin/bash

instanceId=$1
pubkey="$HOME/.ssh/tokyo.pem"
sshUser='centos'

az=$(aws ec2 describe-instances --instance-id ${instanceId} --query 'Reservations[0].Instances[0].Placement.AvailabilityZone' --output text)
publicIp=$(aws ec2 describe-instances --instance-id ${instanceId} --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)


echo "sending public key to ${instanceId}"
aws ec2-instance-connect send-ssh-public-key --instance-id ${instanceId} --instance-os-user ${sshUser} \
--ssh-public-key file://${pubkey} --availability-zone ${az} > /dev/null

if [[ $2 != '--send-key-only' ]]; then
  echo "connecting to ${publicIp} at ${az}"
	ssh ${sshUser}@${publicIp}
fi
