resource "aws_instance" "example" {
   ami = "ami-0220d79f3f480ecf5"
   instance_type = "t3.micro"
   vpc_security_group_ids = [aws_security_group.allow-tls.id] # Terraform is an automatic dependency management 

   tags = {
    Name = "terraform"
    Project = "Roboshop"
   }
}

resource "aws_security_group" "allow-tls" {
   name = "allow-all-terraform" # This for aws
   description = "Allow TLS inbound traffic and all outbound traffic"

   egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
   }

# the below is the repeated code so to avoid by doing like this, terraform created a loop called dynamic

#    ingress{
#     from_port = 3306
#     to_port = 3306
#     protocol = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#    }

#    ingress{
#     from_port = 443
#     to_port = 443
#     protocol = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#    }

# here ingress is going to be special variable
   dynamic "ingress" {
       for_each = var.ingress_rules
       content {
            from_port  = ingress.value.port
            to_port = ingress.value.port
            protocol         = "tcp" # -1 means everything all traffic
            cidr_blocks      = ingress.value.cidr_blocks
            description      =  ingress.value.description
       }
   }


    tags = {
    Name = "allow-all-terraform"
  }

}