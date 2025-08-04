packer {
    required_plugins {
        amazon = {
            version = ">=1.2.8"
            source = "github.com/hashicorp/amazon"
        }
    }
}

source "amazon-ebs" "ubuntu" {
    ami_name = "my_new_ami_image"
    instance_type = "t2.micro"
    region = "us-east-1"
    source_ami_filter {
        filters = {
            name = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
            most_recent = true
            owner = "099720109477"
        }
    }
    ssh_username = "ubuntu"
}

build {
    sources = ["source.amazon-ebs.ubuntu"]
}
