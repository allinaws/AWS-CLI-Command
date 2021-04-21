## 查看
```
➜  ~ aws s3 ls
2021-04-06 22:52:23 advertising-images

➜  ~ aws s3api list-buckets
{
    "Buckets": [
        {
            "Name": "advertising-images",
            "CreationDate": "2021-04-06T14:52:23+00:00"
        }
    ],
    "Owner": {
        "ID": "0b281ef37430a86b092dd21799f46d1b10a075089b089489261ab95091aec2d9"
    }
}
```
## 创建bucket
```
➜  ~ aws s3 mb s3://zhangsan-images --region ap-west-1  #指定区域创建桶
make_bucket: zhangsan-images
aws s3api create-bucket --bucket zhangsan --region ap-east-1
aws s3api create-bucket --bucket zhangsan --region ap-east-1 --acl public-read # 创建只读bucket
```
## 删除bucket

删除存储桶,必须先删除存储桶中的所有对象（包括所有对象版本和删除标记），然后才能删除存储桶本身。
```
➜  ~ aws s3api delete-bucket --bucket zhangsan --region us-east-1
```
## 查看桶下面的目录
```
➜  ~ aws s3 ls s3://advertising-images
2021-04-06 22:43:45     107297 001.jpeg
2021-04-06 22:38:12     107297 飞船.jpeg
➜  ~ aws s3api list-objects --bucket advertising-images --query 'Contents[].{Key: Key, Size: Size}'
```

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
root@jump-Tokyo-2:~# aws s3 mv s3://eosstorebp/2018-07-11-11_39_31.tar.gz s3://eosstorefilebackup/test.tar.gz move: s3://eosstorebp/2018-07-11-11_39_31.tar.gz to s3://eosstorefilebackup/test.tar.gz 

以下mv命令将单个对象移动到指定的存储桶，同时保留其原始名称：
aws s3 mv s3：//mybucket/test.txt s3//mybucket2/ 
```
## 对于文件设置公开读取权限

对于已存储在 Amazon S3 中的对象，您可以运行此命令来更新公开读取访问权限的 ACL

```shell
aws s3api put-object-acl --bucket awsexamplebucket --key exampleobject --acl public-read
```

## 删除bucket生命周期

```
aws s3api delete-bucket-lifecycle --bucket bucketname

```

