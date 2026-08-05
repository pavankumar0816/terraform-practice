resource "aws_route53_record" "roboshop" {
   count = length(var.instances)
   zone_id = var.zone_id
   name = "${var.instances[count.index]}.${var.domain_name}"   # mongodb-pmpkdev.online
   type = "A"
   ttl = 1
   records = [aws_instance.roboshop[count.index].private_ip]
}