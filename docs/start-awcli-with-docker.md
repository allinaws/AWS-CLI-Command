## AWS CLI v2 

使用AWS Cloud9 演示

![](./images/1043682-20200507152852007-2078570094.png)

![](./images/1043682-20200507152904076-2047393356.png)

```
alias aws='docker run --rm -ti -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli'
alias aws='docker run --rm -ti -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli:2.0.6' #指定版本
```

由于第一次执行需要下载 awscli docker image 
但是第二次 第三次执行就没有问题了

```
aws sts get-caller-identity
```
![](./images/1043682-20200507153003385-1322020488.png)

保证 awscli最新的版本
可以pull awscli 的 image

```shell
h.tea:~/environment $ docker pull amazon/aws-cli
Using default tag: latest
latest: Pulling from amazon/aws-cli
Digest: sha256:7a27c26c2937a3d0b84171675709df1dc09aa331e86cad90f74ada6df7b59c89
Status: Image is up to date for amazon/aws-cli:latest
h.tea:~/environment $
```