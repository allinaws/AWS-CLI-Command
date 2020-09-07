# 创建EC2实例

## 启动实例（新创建一个实例）

```
aws  ec2 run-instances \
--image-id ami-0eb2ecc002b356c08 \
--count 1 \
--instance-type m5a.large \
--key-name tokyo-global \
--security-group-ids sg-0241d1de686ce7782  \
--subnet-id subnet-ea042fa3 \
--no-associate-public-ip-address \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=master}]'
```
> 注明：
> --image-id ami-0f77bf77  #需要使用启动的镜像id
> --count 1                #需要启动几台实例
> --instance-type t2.small #实例类型
> --key-name syavingc      #key的名字
> --security-group-ids sg-c239ddb8 sg-7b987c01   #安全组id
> --subnet-id subnet-63c4c504    #子网id
> --no-associate-public-ip-address  #没有公有IP
> --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=test}]' #标签
> 注意⚠️
> 密钥对和安全组必须已经存在
> --associate-public-ip-address   ##分配IP
> --no-associate-public-ip-address  ##不分配IP
> 以上的IP为classicIP

## 启动一个新的实例，并分配IP地址
```
aws  ec2 run-instances \
--image-id ami-0eb2ecc002b356c08 \
--count 1 \
--instance-type m5a.large \
--key-name tokyo-global \
--security-group-ids sg-0241d1de686ce7782  \
--subnet-id subnet-ea042fa3 \
--associate-public-ip-address \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=zhangsan}]'
```
## 启动新的实例时，使用用户数据
用户数据，类似与启动脚本

```
aws ec2 run-instances \
    --image-id ami-abc1234 \
    --count 1 \
    --instance-type m4.large \
    --key-name keypair \
    --user-data file://my_script.txt \
    --subnet-id subnet-abcd1234 \
    --security-group-ids sg-abcd1234
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

## 描述Amazon EC2实例
以下describe-instances示例显示有关指定实例的详细信息
```
aws ec2 describe-instances --instance-ids i-06d139a72cd902e55
```
##根据实例类型描述实例
下面的describe-instances示例仅显示有关指定类型实例的详细信息。
```
aws ec2 describe-instances --filters Name=instance-type,Values=m5.large
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

## 启动新的实例时，使用用户数据

用户数据，类似与启动脚本

```
aws ec2 run-instances \

  --image-id ami-abc1234 \

  --count 1 \

  --instance-type m4.large \

  --key-name keypair \

  --user-data file://my_script.txt \

  --subnet-id subnet-abcd1234 \

  --security-group-ids sg-abcd1234
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

}
```

## 给弹性IP打tags

```
aws ec2 create-tags --resources eipalloc-02cb29a4764313d0f --tags Key=Name,Value=master 
```

## 关联IP到EC2实例

```
aws ec2 associate-address --instance-id i-0345c3689da578f8e --allocation-id eipalloc-02cb29a4764313d0f

{

  "AssociationId": "eipassoc-053d0c23799660649"

}
```

