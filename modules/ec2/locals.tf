locals {
    tagName         = var.env == null ? var.name : "${var.name}-${var.env}"
    dnsPrivateName  = var.env == null ? "${var.name}-internal" :"${var.name}-internal"
    dnsPublicName   = var.env == null ? var.name : "${var.name}-${var.env}"
    iam_policy      = concat(["sts:GetCallerIdentity",], var.iam_policy)
}