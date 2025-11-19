locals {
    tagName         = var.env == "null" ? var.name : "${var.name}-${var.env}"
    dnsPrivateName  = var.env == "null" ? "${var.name}-internal" :"${var.name}-internal"
    dnsPublicName   = var.env == "null" ? var.name : "${var.name}-${var.env}"
}