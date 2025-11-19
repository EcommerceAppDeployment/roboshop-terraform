module "ec2" {
    source          = "./modules/ec2"
    for_each        = var.instances
    ami             = var.ami
    zone_id         = var.zone_id
    Name            = each.key
    instance_type   = each.key["instance_type"]
}