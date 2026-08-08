locals {
    instance_name = "${var.name}-${var.env}"
    instance_type = "t3.micro"
    common_tags = {
        Project = "Roboshop"
        Terraform = "true"
        Environment = "Dev"
    }
    ec2_final_tags = merge(local.common_tags, var.ec2_tags)
    ami_id = data.aws_ami.joindevops.id
}


