#module "ec2" {
#   source          = "./modules/ec2"
#   for_each        = var.databases
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
    for_each        = var.eks
    env             = each.value["env"]
    subnet_ids      = each.value["subnet_ids"]
    node_groups     = each.value["node_groups"]
}