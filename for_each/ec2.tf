#The "each" object can be used only in "module" or "resource" blocks, and only when the "for_each" argument is set.

resource "aws_instance" "roboshop" {
    # for_each = var.instances
    for_each = toset(var.instances)
    ami = var.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_tls.id]

    tags ={
        Name = each.key
        Project = "Roboshop"
        Environment = "Dev"
    }
}

resource "aws_security_group" "allow_tls" {
    name = "allow-all-roboshop"
    description = "Allow TLS inbound and outbound traffic"

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow-all-roboshop"
        Project = "Roboshop"
        Environment = "dev"
        Terraform  = true
    }
}