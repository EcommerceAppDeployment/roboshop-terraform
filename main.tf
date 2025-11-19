module "ec2" {
    for_each        = var.instances
    source          = "./modules/ec2"
    ami             = var.ami
    zone_id         = var.zone_id
    name            = each.key
    instance_type   = each.key["instance_type"]
}