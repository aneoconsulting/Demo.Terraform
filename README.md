# Table of contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Web application onpremise](#Web application onpremise)

# Introduction

This project is created in view of learning [Terraform](https://www.terraform.io/).

# Prerequisites

You must install upon your machine the following software:

* [Dokcer](https://docs.docker.com/engine/install/)
* [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

# Web application onpremise

In directory [wordpress](./wordpress) there are the Terraform configuration files to deploy a Wordpress application on
your local machine. The application is composed of:

* A private docker network
* Two persistent volumes
* A docker container for Wordpress
* A docker container for MariaDB

To deploy the application:

```bash
terraform init
terraform apply -var-file parameters.tfvars
```

The output is the web url of the application:

```bash
web_url = "http://localhost:8080"
```

To destroy all the resources of the application:

```bash
terraform destroy -var-file parameters.tfvars
```





