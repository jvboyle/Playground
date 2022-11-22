locals {
  # Common tags to attach to resources
  common_tags = {
    Name        = "${var.s3_bucket_name}"
    Environment = "${var.s3_bucket_env}"
    Project     = "${var.project_key}"
  }
}

data "aws_route53_zone" "primary" {
  name = "${var.hosted_zone}"
}
