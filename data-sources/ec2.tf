resource "aws_instance" "example" {
   ami = data.aws_ami.joindevops.id
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

   ingress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
   }

    tags = {
    Name = "allow-all-terraform"
  }

}