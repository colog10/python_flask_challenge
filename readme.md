# Challenge - Terraform Infrastructure Repository

## Overview

This repository contains the terraform implementation for DevOps Assignment, is ordered in folders which is described in the following section.

## Folders structure

### Root

| Folder   | Description                                                                          |
| :------- | :----------------------------------------------------------------------------------- |
| infrastructure   | This Folder contains the underlying and services infrastruture |
| modules          | This folder contains the modules used in the infrastructure    |


## Create the infrastructure

1. Run terraform init and terraform apply under "infrastructure" folder. This creates the underlying infrastructure.
2. You will get the "alb_dns_name" which is going to be use as main URL.
2. Go to services/mongo and run terraform init and terraform apply. This creates the mongo service.
3. Go to services/flask_app and run terraform init and terraform apply. This creates the flask+python services.

## Test SSH connection

1. Run 
```
ssh ec2-user@PUBLIC_IP -i challenge
```

## Increase Python+Flask webservers

1. Go to infrastructure/services/flask_app and change in "web.tf" file the variable "desired_count". After that apply the changes with terraform

## Add new SSH keys

1. Open the "user-data.yaml" file under "infrastructure" folder and add the new keys under "ssh_authorized_keys". Apply the changes with terraform.

## Improvements to make to the proposed infrastructure

* Create a Custom VPC with 3 layer pattern (public, private, db)
* Move EC2 instance to private subnets
* Remove public IP from instances
* Add rule to access to the instances through SSM
* Use a domain name insted of LB DNS
* Add SSL 
* Add port:443 rules in LB and redirect all port:80 traffic to it
* Add AutoScaling metrics and alarms 

