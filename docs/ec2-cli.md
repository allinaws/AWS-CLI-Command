## 描述Amazon EC2实例
以下describe-instances示例显示有关指定实例的详细信息
```
aws ec2 describe-instances --instance-ids i-06d139a72cd902e55
```
## 根据实例类型描述实例
下面的describe-instances示例仅显示有关指定类型实例的详细信息。

```
aws ec2 describe-instances --filters Name=instance-type,Values=m5.large
```
## 基于标签描述实例
以下describe-instances示例仅显示有关那些具有带有带有指定标签键（所有者）的标签的实例的详细信息，而不管标签值如何。
```
aws ec2 describe-instances --filters "Name=tag-key,Values=Owner"
```
以下describe-instances示例仅显示有关那些具有带有指定标签值（my-team）的标签的实例的详细信息，而与标签键无关。
```
aws ec2 describe-instances --filters "Name=tag-value,Values=my-team"
```
以下describe-instances示例仅显示有关具有指定标签（Owner = my-team）的那些实例的详细信息。
```
aws ec2 describe-instances --filters "Name=tag:Owner,Values=my-team"
```
## 根据多个条件过滤结果

下面的describe-instances示例显示有关也在指定的可用区中的所有具有指定类型的实例的详细信息。
```
aws ec2 describe-instances \
    --filters Name=instance-type,Values=t2.micro,t3.micro Name=availability-zone,Values=us-east-2c
```
以下describe-instances示例使用JSON输入文件执行与上一个示例相同的过滤。当过滤器变得更加复杂时，可以更轻松地在JSON文件中指定过滤器。
```
aws ec2 describe-instances --filters file://filters.json
```
filter.json的内容：
```
[ 
    { 
        “ Name” ： “ instance-type” ，
        “ Values” ： [ “ t2.micro” ， “ t3.micro” ] 
    }，
    { 
        “ Name” ： “ availability-zone” ，
        “ Values” ： [ “ us- east-2c“ ] 
    } 
]
```
## 将结果限制为仅指定的字段
以下describe-instances示例使用--query参数仅显示指定实例的AMI ID和标签。
```
aws ec2 describe-instances \
    --instance-id i-1234567890abcdef0 \
    --query "Reservations[*].Instances[*].[ImageId,Tags[*]]"
```
以下describe-instances示例使用--query参数仅显示所有实例的实例和子网ID。
Linux命令：
```
aws ec2 describe-instances \
    --query 'Reservations[*].Instances[*].{Instance:InstanceId,Subnet:SubnetId}' \
    --output json
```
Windows命令：
```
aws ec2 describe-instances ^
    --query "Reservations[*].Instances[*].{Instance:InstanceId,Subnet:SubnetId}" ^
    --output json
```
## 描述具有特定标签的实例并将结果过滤到特定字段
下面的describe-instances示例显示具有ID 标签为name tag-key的实例的实例ID，可用区和Name标签的值。
Linux命令：
```
aws ec2 describe-instances \
    --filter Name=tag-key,Values=Name \
    --query 'Reservations[*].Instances[*].{Instance:InstanceId,AZ:Placement.AvailabilityZone,Name:Tags[?Key==`Name`]|[0].Value}' \
    --output table
```

![](https://img2018.cnblogs.com/blog/1043682/201912/1043682-20191217170030142-2028259515.png)

```
 aws ec2 describe-instances \
        --filter Name=tag-key,Values=Name \
        --query 'Reservations[*].Instances[*].{Instance:InstanceId,AZ:Placement.AvailabilityZone,Name:Tags[?Key==`Name`]|[0].Value,Images:ImageId,State:State.Name}' \
        --output table
```

![image-20200907170811256](./images/image-20200907170811256.png)

Windows命令：

```
aws ec2 describe-instances ^
    --filter Name=tag-key,Values=Name ^
    --query "Reservations[*].Instances[*].{Instance:InstanceId,AZ:Placement.AvailabilityZone,Name:Tags[?Key=='Name']|[0].Value}" ^
    --output table
```

## 启动实例
```
aws ec2 start-instances --instance-ids i-1234567890abcdef0
```
## 停止实例
```
aws ec2 stop-instances --instance-ids i-1234567890abcdef0
```
## 重启实例
```
aws ec2 reboot-instances --instance-ids i-1234567890abcdef5
```
## 终止实例
终止实例就是删除实例
```
aws ec2 terminate-instances --instance-ids i-1234567890abcdef0
```

## 查看密钥（keys）

```
  .aws aws ec2 describe-key-pairs
{
    "KeyPairs": [
        {
            "KeyPairId": "key-07d41d20a7bef2784",
            "KeyFingerprint": "f8:eb:00:e7:83:55:86:a8:b7:a7:3a:f3:cc:e7:cd:92:56:a4:12:f3",
            "KeyName": "tokyo-global",
            "Tags": []
        }
    ]
}
```

## 将实例启动到分区放置组中

您可以在不指定分区的情况下将实例启动到分区放置组中。以下运行实例示例将实例启动到指定的分区放置组中。

```
aws ec2 run-instances \
  --image-id ami-abc12345 \
  --count 1 \
  --instance-type t2.micro \
  --key-name MyKeyPair \
  --subnet-id subnet-6e7f829e \
  --placement "GroupName = HDFS-Group-A"
```

## 分配弹性IP

```
➜ ~ aws ec2 allocate-address \

  --domain vpc

{

  "PublicIp": "18.177.76.161",

  "AllocationId": "eipalloc-02cb29a4764313d0f",

  "PublicIpv4Pool": "amazon",

  "Domain": "vpc"


```

## 给弹性IP打tags

```
aws ec2 create-tags --resources eipalloc-02cb29a4764313d0f --tags Key=Name,Value=master 
```

## 关联IP到EC2实例

```
aws ec2 associate-address --instance-id i-0345c3689da578f8e --allocation-id eipalloc-02cb29a4764313d0f
```

## 描述Amazon EC2实例

以下describe-instances示例显示有关指定实例的详细信息

```
aws ec2 describe-instances --instance-ids i-06d139a72cd902e55
```

## 根据实例类型描述实例

下面的describe-instances示例仅显示有关指定类型实例的详细信息。

```
aws ec2 describe-instances --filters Name=instance-type,Values=m5.large
```

## 查看实例公有IP地址

```
 aws ec2 describe-instances --instance-ids i-050596a97168f9df5 --query 'Reservations[0].Instances[0].PublicIpAddress' --output text
```

## 查看实例所在可用区（AZ）

```
aws ec2 describe-instances --instance-id i-050596a97168f9df5 --query 'Reservations[0].Instances[0].Placement.AvailabilityZone' --output text
```

