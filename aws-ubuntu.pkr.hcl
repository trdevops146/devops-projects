packer{
    required_plugins{
        amazon={
            source = "hashicorp/amazon"
            version = "~> 1.0"
        }
    }
}

source "amazon_ebs" "ubuntu" {
    region = "us-east-1"
    ami_name = "project-3-ami-image-1"
    instance_type = "t2.micro"
    source_ami_filter {
        filters = {
            name = "ubuntu-eks-pro/k8s_1.32/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
            root-device-type = "ebs"
            virtualization = "hvm"
            owner = "099720109477"
            most_recent = true
        }
    }
    ssh_username = "ubuntu"
}