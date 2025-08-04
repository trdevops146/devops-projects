packer {
    required_plugins {
        amazon = {
            version = ">=1.2.8"
            source = "github.com/hashicorp/amazon"
        }
    }
}

source "amazon_ebs" "ubuntu" {
    name = "my_new_ami_image"
    instance_type = "t2.micro"
    region = "us-east-1"
    source_ami_filter {
        filters = {
            name = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
            most_recent = true
            owners = ["099720109477"]
        }
    }
    ssh_username = "ubuntu"
    
    provisioner "shell" {
        inline = [
            "sudo apt-get update"
        ]
    }

}

build {
    sources = ["source.amazon_ebs.ubuntu"]
}
