# modules
<!-- TOC -->

- [modules](#modules)
    - [Description](#description)
    - [AWS](#aws)

<!-- /TOC -->

## Description

Modules provide reusability of creating resources across projects.

## AWS

| Name | Description |
| --- | --- |
| [api-gateway-private](aws/api-gateway-private/README.md) | This module creates an API Gateway behind a VPC to make it private |
| [azure-devops-user](aws/azure-devopes-user) | This module creates an IAM User with permissions to support CI/CD |
| [ecr](aws/ecr/README.md) | This module creates a AWS ECR repository with a lifecycle policy for untagged images |
| [lambda](aws/lambda/README.md) | This module requires two separate configurations. First one to create a S3 bucket to store lambda artifact. Second one to create a lambda with cloudwatch log group. |
| [lambda-api](aws/lambda-api/README.md) | This module requires two separate configurations. First one to create a S3 bucket to store lambda artifact. Second one to create a lambda tied to api gateway. |
| [s3](aws/s3/README.md) | This module creates a S3 Bucket using KMS key for encryption. |
| [s3-log-bucket](aws/s3-log-bucket/README.md) | This module creates a S3 Bucket for logging using KMS key for encryption. |