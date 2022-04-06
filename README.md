AMI Maker
================

This will currently build a CentOS 7 AMI using Packer via the chroot method. This must be run from a running AWS instance of similar lineage. i.e. RHEL 7 or CentOS 7 is ideal.

We do this because 1) The official CentOS 7 AMI is an AWS Marketplace offering...which has unfortunate limitations for an open source product. 2) We want full control over the build process.


Layout
------------

Coming soon...


Usage
------------

**BUILD**
```
# packer build -var "aws_access_key=YOURACCESSKEY" -var "aws_secret_key=YOURSECRETKEY" -var "aws_account_id=AWS_ACCOUNT_ID" -var "aws_vpc_id=AWS_VPC_ID" -var "packer_sg_id=AWS_SG_ID" -var "packer_subnet_id=AWS_Subnet_ID" packer/build.json
```



Dependencies
------------

Packer > 0.12.3


License
-------


[Copyright (c) 2021 Ujala Singh]

[Copyright (c) 2021 Ujala Singh]
