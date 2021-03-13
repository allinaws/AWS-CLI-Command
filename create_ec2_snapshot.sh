#!/bin/bash
#create ec2 ebs snapshot per week.
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#xx
log_dir=/tmp/ec2-snapshot/
[ -d ${log_dir} ] || mkdir -p ${log_dir}
aws_user=$(aws iam get-user | awk -F\" ‘/UserName/{print $4}‘)
#获取实例id
for instance_id in $(aws ec2 describe-instances | awk -F '\' '/InstanceId/') ; do
    #获取实例标签名
    tag=$(aws ec2 describe-instances --instance-ids ${instance_id} | grep -C1 "\"Key\": \"Name\"" | awk -F\" ‘/Value/{print $4}‘)
    #通过实例id获取该实例挂载的卷id
    volumes=$(aws ec2 describe-instances --instance-ids  ${instance_id} | awk -F\" ‘/VolumeId/{print $4}‘)
    #通过卷id创建快照
    for volume in $volumes ; do
        aws ec2 create-snapshot --volume-id $volume --description "$(date +%F\ %T) UTC create snapshot for $tag $volume by $aws_user on host: $(whoami)@$(hostname)"         &>> ${log_dir}create-snapshot-history.log
        #获取快照id
        snap_shotId=$(tail -11 ${log_dir}create-snapshot-history.log | awk -F\" ‘/SnapshotId/{print $4}‘)
        sleep 10
        #创建快照标签名字，实例标签_时期
        aws ec2 create-tags --resources ${snap_shotId} --tags Key=Name,Value=${tag}_${volume}_$(date +%Y%m%d)
        echo ${snap_shotId} >> ${log_dir}$volume.log
        #判断每个卷的快照数，大于3个,删除超过3个的最久的快照
        num_snap=$(wc -l ${log_dir}$volume.log | awk ‘{print $1}‘)
        if [ ${num_snap} -gt 3 ] ;then
            old_snapshotid=$(head -$[${num_snap}-3] ${log_dir}$volume.log)
            for delid in ${old_snapshotid} ;do
                aws ec2 delete-snapshot --snapshot-id ${delid} 2>> ${log_dir}del-snapshot-error.log
                sed -i ‘/‘"$delid"‘/d‘ ${log_dir}$volume.log
            done
        fi
    done
done
