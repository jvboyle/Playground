resource "aws_cloudfront_distribution" "site" {
  enabled = true
  default_root_object = "index.html"

  origin {
    domain_name = aws_s3_bucket.site.bucket_domain_name
    origin_id   = var.s3_bucket_name

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }
  

  #viewer_certificate {
  #  cloudfront_default_certificate = true
  #}
  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-east-1:381438718674:certificate/d5079584-6c32-4655-95a8-f12d5f13b20a"
    ssl_support_method  = "sni-only"
  }
  
  custom_error_response {
    error_code    = 403
    response_code = 200
    response_page_path = "/index.html"
  }

  custom_error_response {
    error_code    = 404
    response_code = 200
    response_page_path = "/index.html"
  }

  # Route53 requires Alias/CNAME to be setup
  aliases = ["${var.s3_bucket_name}"]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.s3_bucket_name

    forwarded_values {
      query_string = true

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = var.cache_default_ttl
    max_ttl                = var.cache_max_ttl
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Name        = var.s3_bucket_name
    Environment = var.s3_bucket_env
    Project     = var.project_key
  }
}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "Origin Access Identity for S3"
}

output "cloudfront"{
  value = "${aws_cloudfront_distribution.site.domain_name}"
}
