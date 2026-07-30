variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "RHEL 9 image"
}

variable "environment" {
    type = string
    default = "dev"
    description = "Environment"
}

variable "ec2_tags" {
    type = map
    default = {
        Name = "conditions-demo"
        Project = "Roboshop"
        Environment = "dev"
        Terraform  = true
    }
}

variable "sg_name" {
    type = string
    default = "allow-all-terraform-default"
}

variable "sg_description" {
    type = string
    default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "from_port" {
    type = number
    default = 0
}

variable "to_port" {
    type = number
    default = 0
}

variable "protocol" {
    default = "-1"
}

variable "cidr_block" {
    type = list 
    default = ["0.0.0.0/0"]
}

variable "sg_tags" {
    type = map 
    default = {
        Name = "allow-all-terraform"
        Project = "Roboshop"
        Environment = "dev"
        Terraform  = true
    }
}