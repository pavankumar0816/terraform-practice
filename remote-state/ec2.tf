resource "aws_instance" "remote_state" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.remote_state_sg.id]

    tags = {
        Name = "remote-state-terraform"
        Terraform = true
    }
}

resource "aws_security_group" "remote_state_sg" {
    name = "remote-state-sg"
    description = "SG for remote state"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "remote-state-sg"
        Terraform = true
    }
}