env         = "dev"
ami         = "ami-09c813fb71547fc4f"
zone_id     = "Z08786032W2NWXT9UW4JD"
zone_name   = "sdevops.shop"
instances   = {
    default = {
        frontend = {
            instance_type = "t2.micro"
        }
    }
}