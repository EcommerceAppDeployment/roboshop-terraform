variable "tools" {
    vault = {
        instance_type = "t2.micro"
    }
}
variable "env" {
    default = null
}
variable "ami" {}
variable "zone_id" {}