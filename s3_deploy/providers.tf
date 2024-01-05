terraform {
  cloud {
    organization = "example-org-fd2bbd"

    workspaces {
      name = "getting-started"
    }
  }
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.aws_region
}
