# create a hosted zone for the domain name
resource "aws_route53_zone" "main" {
  name = var.domain_name
  tags = var.common_tags
}

# create an A record for www
resource "aws_route53_record" "www-a" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.www_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.www_distribution.hosted_zone_id
    evaluate_target_health = false

  }
}

# create an A record for root

resource "aws_route53_record" "root-a" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name = aws_cloudfront_distribution.root_distribution.domain_name
    zone_id = aws_cloudfront_distribution.root_distribution.hosted_zone_id
    evaluate_target_health = false
  }

}