env         = "dev"
ami         = "ami-09c813fb71547fc4f"
zone_id     = "Z08786032W2NWXT9UW4JD"
#zone_name   = "sdevops.shop"
instances   = {
    frontend = {
        instance_type = "t2.micro"
    }
    dispatch = {
        instance_type = "t2.micro"
    }
    cart = {
        instance_type = "t2.micro"
    }
    catalogue = {
        instance_type = "t2.micro"
    }
    mongodb = {
        instance_type = "t2.micro"
    }
    mysql = {
        instance_type = "t2.micro"
    }
    payment = {
        instance_type = "t2.micro"
    }
    rabbitmq = {
        instance_type = "t2.micro"
    }
    redis = {
        instance_type = "t2.micro"
    }
    shipping = {
        instance_type = "t2.micro"
    }
    user = {
        instance_type = "t2.micro"
    }
}