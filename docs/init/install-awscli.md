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

查看安装版本

```shell
aws --version
aws-cli/2.0.5 Python/3.7.4 Darwin/19.3.0 botocore/2.0.0dev9
```

## 客户端分页

AWS CLI 版本 2 支持使用客户端分页程序对输出进行处理。默认情况下，此功能会通过操作系统的默认分页程序返回所有输出。客户端分页在您指定的任何服务器端分页操作完成之后执行。

要完全禁用外部分页程序，请将该变量设置为空字符串。

```
[default]
cli_pager =   ##注意 = 左右有空格，一定要设置这个，要不用起来不习惯
```