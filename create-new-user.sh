#!/bin/bash

aws iam create-user --user-name test-user
credentials=$(aws iam create-access-key --user-name test-user \
    --query 'AccessKey.[AccessKeyId,SecretAccessKey]' \
    --output text)
access_key_id=$(echo $credentials | cut -d ' ' -f 1)
secret_access_key=$(echo $credentials | cut -d ' ' -f 2)
aws configure set profile.test.aws_access_key_id "$access_key_id"
aws configure set profile.test.secret_access_key "$secret_access_key"
