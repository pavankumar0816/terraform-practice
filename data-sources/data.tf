data "aws_ami" "joindevops" {
    most_recent = true
    owners = ["973714476881"]

    filter {
        name = "name"
        values = ["Redhat-9-DevOps-Practice"]
    }

    filter {
        name = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
}

# If I manually create an EC2 instance and want to fetch all its details in Terraform means:

data "aws_instance" "terraform_instance" { # "aws_instance" is for single instance ; use the aws_instances data source to retrieve a list of IDs or IPs for multiple ec2 instances
    instance_id = "i-03862e2751ab4a64e"
}