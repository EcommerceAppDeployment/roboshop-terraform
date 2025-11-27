env         = "dev"
ami         = "ami-00b4d312883eab224"
zone_id     = "Z08786032W2NWXT9UW4JD"
#zone_name   = "sdevops.shop"
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

eks = {
    main ={
        env = "dev"
        subnet_ids = [ subnet-0117cdfaf46842167, subnet-0b0561e5654e35569, subnet-0b5abd68e3e0182a1 ]
        node_groups = {
            one = {
               min_size = 1
               max_size = 2 
            }
        }
    }
}