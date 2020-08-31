# S3 CLI

注意⚠️
s3命令行有I，一个是s3,一个是s3api，
s3只是基础使用，创建、删除、更新、同步、复制、等等
s3api是可以操作S3整个服务；我们大多数使用命令行都是使用s3api的

## 创建\查看\删除
```
➜  ~ aws s3 ls #查看账号下面所创建的桶
2019-09-14 21:41:44 15b883-tools
2019-11-10 16:42:33 htea-demo-bucket
➜  ~ aws s3api list-buckets #查看账号下面所创建的桶
{
    "Buckets": [
        {
            "Name": "15b883-tools",
            "CreationDate": "2019-09-14T13:41:44.000Z"
        },
        {
            "Name": "htea-demo-bucket",
            "CreationDate": "2019-11-10T08:42:33.000Z"
        }
    ],
    "Owner": {
        "DisplayName": "syavingc.s",
        "ID": "2c6a8d6c299210d1288dcf00dd6976249c4b85464a3fa10a002469ae5be5cda5"
    }
}
➜  ~ aws s3 mb s3://zhangsan-images --region us-west-1  #指定区域创建桶
make_bucket: zhangsan-images
➜  ~ aws s3 ls
2019-09-14 21:41:44 15b883-tools
2019-11-10 16:42:33 htea-demo-bucket
2019-12-14 14:28:02 zhangsan-images
➜  ~ aws s3api delete-bucket --bucket zhangsan-images #删除创建的桶 (删除存储桶,必须先删除存储桶中的所有对象（包括所有对象版本和删除标记），然后才能删除存储桶本身。)
➜  ~ aws s3 ls
2019-09-14 21:41:44 15b883-tools
2019-11-10 16:42:33 htea-demo-bucket
➜  ~
```
## 查看桶下面的目录
```
aws s3 ls s3://eosstorebp PRE eos-mbp/ PRE eos-open-fn-1-1/ PRE eos-sbp1/ 
aws s3 ls s3://eosstorebp/eos-sbp1/ 
2018-06-19 05:31:19 0 
2018-06-19 06:01:01 9 1.txt 
2018-06-19 07:26:20 4 123.txt 
```
## 将S3的文件复制到本地/data目录下
命令方式： aws s3 命令 s3://某个桶/123.txt 本地目录/文件 root@eostestserver-01:/data# ls #查看/data目录下的数据 eoskeeper.log root@eostestserver-01:/data# aws s3 cp s3://eosstorebp/eos-sbp1/123.txt /data/123.txt #复制 download: s3://eosstorebp/eos-sbp1/123.txt to ./123.txt root@eostestserver-01:/data# ls 123.txt eoskeeper.log 

## 本地文件同步到S3
```
aws s3 sync /data/. s3://eosstorebp/eos-sbp1/ 
```
## S3文件同步到本地
```
aws s3 sync s3://eosstorebp/eos-sbp1/test.txt /data/ 
```
## 从某个桶移动到另一个桶
```
root@jump-Tokyo-2:~# aws s3 mv s3://eosstorebp/2018-07-11-11_39_31.tar.gz s3://eosstorefilebackup/test.tar.gz move: s3://eosstorebp/2018-07-11-11_39_31.tar.gz to s3://eosstorefilebackup/test.tar.gz 以下mv命令将单个对象移动到指定的存储桶，同时保留其原始名称： aws s3 mv s3：//mybucket/test.txt s3//mybucket2/ 
```
## 对于文件设置公开读取权限

对于已存储在 Amazon S3 中的对象，您可以运行此命令来更新公开读取访问权限的 ACL

```shell
aws s3api put-object-acl --bucket awsexamplebucket --key exampleobject --acl public-read
```



## 创建一个桶

```
aws s3 mb s3://test20181029 
##aws s3api create-bucket --bucket test20181030 --region ap-northeast-1（有问题、、）
递归创建目录 aws s3api put-object --bucket test20181029 --key 111/222/333/ 
#递归查看桶内信息 aws s3 ls s3://test20181029/111/222/333/ 
递归删除目录 aws s3api delete-object --bucket test20181029 --key 111/222/333 
递归查看bucket信息 aws s3 ls s3://mybucket/ --recursive 
递归查看bucket信息 下面的ls命令使用人类可读和汇总选项演示了相同的命令。——人类可读的显示文件大小字节/MiB/KiB/GiB/TiB/PiB/EiB。—汇总显示结果列表末尾的对象总数和总大小:
aws s3 ls s3://mybucket/ --recursive --human-readable --summarize

[root@krhgw11 ~]# aws s3api put-object --bucket syavingcs --key test01/test02/

An error occurred (NoSuchBucket) when calling the PutObject operation: The specified bucket does not exist

#递归创建目录。注意！最后的目录一定要有(/) [root@krhgw11 ~]# aws s3api put-object --bucket krf-p-s3-archive-backup --key archive/web01/os/ { "ETag": "\"d41d8cd98f00b204e9800998ecf8427e\"" } 


from boto3.session import Session import boto3 #Client初始化 access_key = "您的AccessKey" secret_key = "您的SecretKey" url = "您的Endpoint" #例如：'http://IP:PORT' 或者 'http://eos-beijing1.cmecloud.cn' 或者 'http://eos-beijing-2.cmecloud.cn' session = Session(access_key, secret_key) s3_client = session.client('s3', endpoint_url=url) #Client初始化结束 #列出该用户拥有的桶 print [bucket['Name'] for bucket in s3_client.list_buckets()['Buckets']] 

##查看bucket的生命周期 
```
```
1、将 JSON 生命周期配置保存在一个文件 (lifecycle.json) 中。
2、运行以下 AWS CLI 命令以在存储桶上设置生命周期配置：
## 创建bucket生命周期
```


aws s3api put-bucket-lifecycle-configuration \
--bucket bucketname \
--lifecycle-configuration file://lifecycle.json 



## 删除bucket生命周期

```
aws s3api delete-bucket-lifecycle --bucket bucketname

```

