ami         = "ami-0ec3cf33a6aaacd53"
#ami         = "ami-00b4d312883eab224"
zone_id     = "Z08786032W2NWXT9UW4JD"
tools       = {
    vault_p = {
        instance_type = "t2.micro"
        volume_size   = 20
        iam_policy    = []
    }
    github_runner = {
        instance_type = "t2.micro"
        volume_size   = 20
        iam_policy    = ["*"]
    }
}
 