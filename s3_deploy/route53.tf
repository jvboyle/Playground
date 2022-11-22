resource "aws_route53_record" "subdomain" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "${var.subdomain}.${var.domain}"
  type    = "A"

  alias {
    name = aws_cloudfront_distribution.site.domain_name
    zone_id = "Z2FDTNDATAQYW2" # CloudFront ZoneID (https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-route53-aliastarget.html)
    evaluate_target_health = false
  }
}
