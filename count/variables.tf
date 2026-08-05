variable "instances" {
    type = list
    default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]
}

variable "zone_id" {
    type = string
    default = "Z0904912RYBEMT97WDTB"
}

variable "domain_name" {
    type = string
    default = "pmpkdev.online"
}