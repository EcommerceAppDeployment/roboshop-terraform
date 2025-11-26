#module "ec2" {
#   source          = "./modules/ec2"
#   for_each        = var.instances
#   ami             = var.ami
#   zone_id         = var.zone_id
#   name            = each.key
#   instance_type   = each.value["instance_type"]
#   volume_size     = each.value["volume_size"]
#   env             = var.env
#   token           = var.token
#   iam_policy      = []
#}

module "eks" {
    source          = "./modules/eks"
    env             = var.env
}