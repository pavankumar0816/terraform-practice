variable "name" {
    type = string
    default = "locals"
}

variable "env" {
    type = string
    default = "dev"
}

variable "instance_type" {
    default = "t3.large"
}


# variable "instance_name" {
#     type = string
#     default = "${var.name}-${var.env}" # locals-dev
# }

variable "ec2_tags" {
    default = {
        Name = "locals-demo"
        Environment = "prod"
    }
}

variable "sg_tags" {
    default = {
        Name = "locals-demo"
    }
}