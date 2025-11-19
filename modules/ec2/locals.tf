locals {
    tagName         = var.env == "null" ? var.name : "${var.name}-${var.env}"
    dnsPrivateName  = var.env == "null" ? "${var.name}-internal" : "${var.name}-${var.env}"
    dnsPublicName   = var.env == "null" ? var.name : "${var.name}-${var.env}"
}