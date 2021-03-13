




aws_user=$(aws iam get-user |awk -F\" '/UserName/{print $4}')

for instance_Id in $(aws ec2 describe-instances |awk -F '\' '/InstanceId/'); do
  aws ec2 describe-instances --instance-ids ${instance_Id} |grep -C1 "\"Key\": \"Name\"" |awk -F\" '/Value/{print $4}'

done
