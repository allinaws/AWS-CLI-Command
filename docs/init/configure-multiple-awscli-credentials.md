默认情况下，AWS CLI 使用 default 配置文件。
你可以通过指定 --profile 选项并指定名称来创建和使用具有不同的凭证和设置的其他命名配置文件

## 配置参数

```
➜  ~ aws configure  ## 配置默认用户
AWS Access Key ID [None]: ABCDEFGIAI44QH8DHA
AWS Secret Access Key [None]: QWERTY9Utk/h3yCo8nvbEsXAMPLEKEY
Default region name [None]: ap-northeast-1
Default output format [None]: json
➜  ~ aws configure --profile testuser  ## 配置测试用户
AWS Access Key ID [None]: ABCDEFGIAI44QH8DHA
AWS Secret Access Key [None]: QWERTY9Utk/h3yCo8nvbEsXAMPLEKEY
Default region name [None]: ap-east-1
Default output format [None]: json
```

## 通过配置文件查看配置的信息

注意配置文件里面需要加上`cli_pager =`这个参数

对于AWS凭证，你可以直接修改下面两个文件进行添加凭证

```
➜  ~ cat .aws/config
[default]
region = ap-northeast-1
output = json
cli_pager =
[profile testuser]
region = ap-east-1
cli_pager =

➜  ~ cat .aws/credentials
[default]
aws_access_key_id = ABCDEFGIAI44QH8DHA
aws_secret_access_key = QWERTY9Utk/h3yCo8nvbEsXAMPLEKEY
[testuser]
aws_access_key_id = ABCDEFGIAI44QH8DHA
aws_secret_access_key = QWERTY9Utk/h3yCo8nvbEsXAMPLEKEY
```
## 查询所属用户
```
aws sts get-caller-identity
aws sts get-caller-identity --profile testuser
```

## 查看profile文件所有配置信息

出所有配置文件名称，请使用 `aws configure list-profiles` 命令。
此功能仅适用于 AWS CLI 版本 2
```
➜  ~ aws configure list-profiles
default
testuser
```