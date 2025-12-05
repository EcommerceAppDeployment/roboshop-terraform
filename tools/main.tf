module "tools" {
    source = "../modules/ec2"
    for_each        = var.tools
    ami             = var.ami
    zone_id         = var.zone_id
    name            = each.key
    instance_type   = each.value["instance_type"]
    volume_size     = each.value["volume_size"]
    env             = var.env
    iam_policy      = each.value["iam_policy"]
    token           = var.token
}

resource "aws_ecr_repository" "main" {
    for_each            = var.ecr
    name                = each.key
    image_tag_mutability= each.value
}
