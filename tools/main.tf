module "tools" {
    source = "../modules/ec2"
    for_each        = var.tools
    ami             = var.ami
    zone_id         = var.zone_id
    name            = each.key
    instance_type   = each.value["instance_type"]
    env             = var.env
    iam_policy      = []
    token           = var.token
}

