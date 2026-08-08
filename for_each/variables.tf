variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
} 

# variable "instances" {
#     type = map
#     default = {
#         mongodb = "t3.micro"
#         user = "t3.micro"
#         shipping = "t3.small"
#         mysql = "t3.small"
#     }
# }

# This should be converted to set 
variable "instances" {
    type = list
    default = ["mongodb", "redis", "frontend"]
}
 
variable "zone_id" {
    type = string
    default = "Z0904912RYBEMT97WDTB"
}

variable "domain_name" {
    type = string
    default = "pmpkdev.online"
}
