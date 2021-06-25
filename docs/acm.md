## AWS Certificate Manager

加密证书，就是https加密证书

### 查看证书

```
aws acm list-certificates
```

### 导入证书

```
aws acm import-certificate --certificate fileb://Certificate.pem \
      --certificate-chain fileb://CertificateChain.pem \
      --private-key fileb://PrivateKey.pem 	
```

注意:ertificateChain.pem这个信息有时候会和Certificate.pem在一个文件里面

### 查看证书详细信息

```
aws acm get-certificate --certificate-arn arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012
```

