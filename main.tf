module "ec2" {
    for_each        = var.instances
    source          = ./modules/ec2
    ami             = var.ami
    zone_id         = var.zone_id
    zone_name       = var.zone_name
    name            = each.key
    instance_type   = each.key["instance_type"]
}