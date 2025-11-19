#Create AWS ec2 instance
resource "aws_instance" "my_ec2_instance" {
    ami           = var.ami
    instance_type = var.instance_type
                          
    tags = {
      Name = local.tagName
    }
}

#Create public dns record
resource "aws_route53_record" "public_record" {
  zone_id = var.zone_id
  name    = local.dnsPublicName
  type    = "A"
  ttl     = 300
  records = [aws_instance.my_ec2_instance.public_ip]
}

# Create private dns record
resource "aws_route53_record" "private_record" {
  zone_id = var.zone_id
  name    = local.dnsPrivateName
  type    = "A"
  ttl     = 300
  records = [aws_instance.my_ec2_instance.private_ip]
}

# Create a null resource to trigger the ansible configuration
resource "null_resource" "cluster" {
  depends_on = [aws_route53_record.public_record, aws_route53_record.private_record ]
  connection {
    type        = "ssh"
    user        = "ec2-user" 
    password    = "DevOps321"
    host        = element(aws_instance.my_ec2_instance.private_ip, 0)
  }

  provisioner "remote-exec" {
    inline = [
      "ansible-pull -i localhost, -U https://github.com/EcommerceAppDeployment/roboshop-ansible playbook.yml -e role_name=${var.name} -e env=${var.env} "
    ]
  }
}