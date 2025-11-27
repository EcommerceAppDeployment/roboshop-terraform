env         = "prod"
ami         = "ami-00b4d312883eab224"
zone_id     = "Z08786032W2NWXT9UW4JD"
zone_name   = "sdevops.shop"
databases   = {
    mongodb = {
        instance_type = "t2.micro"
        volume_size   = 20
    }
    mysql = {
        instance_type = "t2.micro"
        volume_size   = 20
    }
    rabbitmq = {
        instance_type = "t2.micro"
        volume_size   = 20
    }
    redis = {
        instance_type = "t2.micro"
        volume_size   = 20
    }
}
eks = {}