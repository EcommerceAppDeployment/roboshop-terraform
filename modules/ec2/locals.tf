locals {
    tagName         = var.env == "tool" ? var.name : "${var.name}-${var.env}"
    dnsPrivateName  = var.env == "tool" ? "${var.name}-internal" :"${var.name}-internal"
    dnsPublicName   = var.env == "tool" ? var.name : "${var.name}-${var.env}"
    iam_policy      = concat(["sts:GetCallerIdentity",], var.iam_policy)
}