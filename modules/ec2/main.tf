#Create AWS ec2 instance
resource "aws_instance" "my_ec2_instance" {
    ami                   = var.ami
    instance_type         = var.instance_type
    iam_instance_profile  = aws_iam_instance_profile.main.name
    vpc_security_group_ids = [data.aws_security_group.allow-all.id]
    root_block_device {
      volume_size = var.volume_size   
      volume_type = "gp3"
    }               
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

# Create a null resource to trigger the ansible configuration for tools only
resource "null_resource" "ansible_tool" {
  depends_on  = [aws_route53_record.public_record, aws_route53_record.private_record ]
  count       = var.env=="tool" ? 1 : 0
  triggers = {
    always_run = timestamp()
  }
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = data.vault_generic_secret.ssh-creds.data["USER"]
      password    = data.vault_generic_secret.ssh-creds.data["PASSWORD"]
      host        = aws_instance.my_ec2_instance.private_ip
    }
    inline = [
      "sudo pip install hvac",
      "ansible-pull -i localhost, -U https://github.com/EcommerceAppDeployment/roboshop-ansible playbook.yml -e role=${var.name} -e env=${var.env} -e token=${var.token} | sudo tee /opt/ansible.log"
    ]
  }
}

# Create a null resource to trigger the ansible configuration for databases
resource "null_resource" "ansible" {
  depends_on  = [aws_route53_record.public_record, aws_route53_record.private_record ]
  count       = var.env=="tool" ? 0 : 1
  triggers = {
    always_run = timestamp()
  }
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user" 
      password    = "DevOps321" 
      host        = aws_instance.my_ec2_instance.private_ip
    }
    inline = [
      "ansible-pull -i localhost, -U https://github.com/EcommerceAppDeployment/roboshop-ansible playbook.yml -e role=${var.name} -e env=${var.env}  | sudo tee /opt/ansible.log"
    ]
  }
}