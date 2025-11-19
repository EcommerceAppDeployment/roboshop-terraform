resource "aws_instance" "my_ec2_instance" {
    ami           = var.ami
    instance_type = var.instance_type
                          
    tags = {
      Name = local.tagName
    }
}

resource "aws_route53_record" "public_record" {
  zone_id = var.zone_id
  name    = local.dnsPublicName
  type    = "A"
  ttl     = 300
  records = [aws_instance.my_ec2_instance.public_ip]
}

resource "aws_route53_record" "private_record" {
  zone_id = var.zone_id
  name    = local.dnsPrivateName
  type    = "A"
  ttl     = 300
  records = [aws_instance.my_ec2_instance.private_ip]
}