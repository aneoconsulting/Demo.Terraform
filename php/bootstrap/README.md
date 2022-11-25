# Table of contents

- [Introduction](#introduction)
- [Deploy](#deploy)
- [Execute PHP](#execute-php)
- [Destroy](#destroy)

# Introduction

Template for a Terraform project of an infrastructure composed of an PHP container and Nginx container.

# Implement the missing resources

Partial files:
- `main.tf`
- `outputs.tf`
- `variables.tf`

# Deploy

```bash
terraform init
terraform apply
```

# Execute PHP

```bash
curl http://localhost:8080
```

# Destroy

```bash
terraform destroy
```
