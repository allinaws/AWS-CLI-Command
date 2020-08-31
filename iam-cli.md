# IAM CLI

## 创建用户

```shell
aws iam create-user --user-name username
```

## 删除用户

```
aws iam delete-user --user-name username

aws iam delete-access-key --access-key-id AKIAX47Z4XOCWVYLGEEE --user-name test-user

AKIAX47Z4XOC5LAA427I
```



## 查看现有用户

```shell
aws iam list-users
##
aws iam get-user |awk -F\" '/UserName/{print $4}' ##过滤出 IAM 用户名
```

## 创建用户组

```shell
aws iam create-group --group-name usergroup
```

## 查看用户组

```
aws iam list-groups
```

## 把用户加入组

```shell
aws iam add-user-to-group --user-name ops --group-name usergroup
```

## 查看组内用户

```
aws iam get-group --group-name username
```

 ## 为指定用户设置初始密码

```
aws iam create-login-profile --user-name username --password 1@3#5 --password-reset-required
```

## 为用户更新密码

```
aws iam update-login-profile --user-name username --password 123456
```

## 为IAM用户创建秘钥（AKSK）

```
aws iam create-access-key --user-name username
```

## 查看用户AKSK

```
aws iam list-access-keys --user-name username
```





## 为IAM用户删除秘钥

```
aws iam delete-access-key --user-name ops --access-key-id AKIAIOSFODNN7EXAMPLE
```

## 获取账号ID

```shell
aws sts get-caller-identity
```

 ## 获取Region信息

```shell
aws configure get region
```

## 查看密钥信息

```
aws iam list-access-keys
```

## 查看策略信息

```shell
aws iam list-roles
```

## create role

```
aws iam create-policy --policy-name my-policy --policy-document file://policy

#############################
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::my-bucket/shared/*"
            ]
        }
    ]
}
```

## 把策略附加到用户、组、角色上面

### 用户

```shell
aws iam attach-user-policy --policy-arn arn:aws:iam:ACCOUNTID:aws:policy/AdministratorAccess --user-name Alice
```

### 组

```shell
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess --group-name Finance
```

### 角色

```shell
aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess --role-name ReadOnlyRole
```



