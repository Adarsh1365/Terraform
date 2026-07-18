resource "aws_route53_record" "mongodb" {
  zone_id = local.hosted_zone_id
  name = "mongodb.${var.environment}.${local.domain_name}"
  type = "A"
  ttl = 1
  records = [aws_instance.mongodb.private_ip]
}