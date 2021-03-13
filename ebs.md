## 卷

创建一个卷

```
aws ec2 create-volume \
    --volume-type gp2 \
    --size 80 \
    --availability-zone us-east-1a
```

修改卷大小

```
aws ec2 modify-volume --size 150 --volume-id vol-1234567890abcdef0
```

修改卷IOPS

```
aws ec2 modify-volume \
    --volume-type io1 \
    --iops 10000 \
    --size 350 \
    --volume-id vol-1234567890abcdef0
```

