
data "aws_route53_zone" "selected" {
  name         = "4bzone.net"
#  private_zone = false
}


resource "aws_route53_record" "headscale_record" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "connect"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.elastic.public_ip]
}