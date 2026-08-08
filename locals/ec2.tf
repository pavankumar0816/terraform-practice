resource "aws_instance" "locals" {
    ami = local.ami_id
    instance_type = local.instance_type
    vpc_security_group_ids = [aws_security_group.remote_state_sg.id]

    tags = local.ec2_final_tags
}

resource "aws_security_group" "remote_state_sg" {
    name = "local-state-sg"
    description = "SG for local state"

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