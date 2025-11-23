#Create AWS ec2 instance
resource "aws_instance" "my_ec2_instance" {
    ami                   = var.ami
    instance_type         = var.instance_type
    iam_instance_profile  = aws_iam_instance_profile.main.name
     vpc_security_group_ids = [data.aws_security_group.allow-all.id]               
    tags                  = {
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
resource "null_resource" "ansible" {
  depends_on = [aws_route53_record.public_record, aws_route53_record.private_record ]
  triggers = {
    always_run = timestamp()
  }
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "{{ lookup('community.hashi_vault.hashi_vault', 'secret=roboshop-infra/data/ec2:USER token={{token}} url=https://vault_p-internal.sdevops.shop:8200 validate_certs=false') }}" 
      password    = "{{ lookup('community.hashi_vault.hashi_vault', 'secret=roboshop-infra/data/ec2:PASSWORD token={{token}} url=https://vault_p-internal.sdevops.shop:8200 validate_certs=false') }}"
      host        = aws_instance.my_ec2_instance.private_ip
    }
    inline = [
      "sudo pip3.11 install ansible",
      "sudo pip3.11 install hvac",
      "ansible-pull -i localhost, -U https://github.com/EcommerceAppDeployment/roboshop-ansible playbook.yml -e role=${var.name} -e env=${var.env} -e token=${var.token}"
    ]
  }
}