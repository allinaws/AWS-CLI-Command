# AWS CLI 中文入门指南

根据[《AWS CLI Command Reference》](https://docs.aws.amazon.com/zh_cn/cli/latest/reference/)翻译与学习，整理后为中文名《AWS CLI 中文入门指南》

AWS CLI 是一种开源工具，让您能够在命令行 Shell 中使用命令与 AWS服务进行交互

-  linux shell

-  windows powershell

-  ec2 实例上（linux shell & windows powershell）

## 安装

Windows

方式一：

[从 https://awscli.amazonaws.com/AWSCLIV2.msi 下载适用于 Windows（64 位）的 AWS CLI MSI 安装程序](https://awscli.amazonaws.com/AWSCLIV2.msi)

方式二：

cmd命令行下面 使用pip 安装，需要提前安装pip命令

Linux

```
pip install awscli
```

MacOS

```
pip install awscli
```

## 卸载：

Windows 在控制面板卸载

Linux&Mac 如何使用pip 安装的 可以使用下面命令卸载

```
pip uninstall awscli
```

##确实安装

```shell
# aws --version
aws-cli/2.0.5 Python/3.7.4 Darwin/19.3.0 botocore/2.0.0dev9
```

## 使用：

![](./images/awscli-usage.png)

```
aws ec2 describe-instances
```

**注意！！！**

本文操作都基于CentOS7、AWSCLI 2.0版本，如果其中有与1.0版本不同的地方会指正出来

## 客户端分页

AWS CLI 版本 2 支持使用客户端分页程序对输出进行处理。默认情况下，此功能会通过操作系统的默认分页程序返回所有输出。客户端分页在您指定的任何服务器端分页操作完成之后执行。

要完全禁用外部分页程序，请将该变量设置为空字符串。

```
[default]
cli_pager =   ##注意 = 左右有空格，一定要设置这个，要不用起来不习惯
```

