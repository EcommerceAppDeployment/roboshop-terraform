env         = "prod"
ami         = "ami-00b4d312883eab224"
zone_id     = "Z08786032W2NWXT9UW4JD"
zone_name   = "sdevops.shop"
instances   = {
    default = {
        frontend = {
            instance_type = "t2.micro"
        }
    }
}