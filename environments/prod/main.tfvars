env         = "prod"
ami         = "ami-00b4d312883eab224"
zone_id     = "Z08786032W2NWXT9UW4JD"
zone_name   = "sdevops.shop"
instances   = {
    frontend = {
        instance_type = "t2.micro"
        volume_size   = 20
    }
    dispatch = {
        instance_type = "t2.micro"
        volume_size   = 20
    }
    cart = {
        instance_type = "t2.micro"
        volume_size   = 40
    }
    catalogue = {
        instance_type = "t2.micro"
        volume_size   = 80
    }
    mongodb = {
        instance_type = "t2.micro"
        volume_size   = 20
    }
    mysql = {
        instance_type = "t2.micro"
        volume_size   = 20
    }
    payment = {
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
    shipping = {
        instance_type = "t2.micro"
        volume_size   = 80
    }
    user = {
        instance_type = "t2.micro"
        volume_size   = 40
    }
}