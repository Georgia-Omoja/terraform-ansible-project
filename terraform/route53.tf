#HOSTED ZONE
resource "aws_route53_zone" "route53-zone" {
    name = var.domain_name
    vpc {
      vpc_id = aws_vpc.vpc.id
    }
    tags = {
      Environment = "route53"
    }
}


#DNS RECORD
resource "aws_route53_record" "record-001" {
    zone_id = aws_route53_zone.route53-zone.zone_id
    name = "terraform-test.georgiaaltschoolcloudengineering.co.uk"
    type = "A"
    ttl = var.record_ttl
    records = [aws_lb.alb.public_ip]
}