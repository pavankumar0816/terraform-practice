resource "aws_route53_record" "roboshop" {
   count = length(var.instances)
   zone_id = var.zone_id
   name = "${var.instances[count.index]}.${var.domain_name}"   # mongodb-pmpkdev.online
   type = "A"
   ttl = 1
   records = [aws_instance.roboshop[count.index].private_ip]
   #records = var.instances[count.index] == "frontend" ? [aws_instance.roboshop[count.index].public_ip] : [aws_instance.roboshop[count.index].private_ip]
}

# as part of functions
# roboshop.pmpkdev.online
resource "aws_route53_record" "roboshop-frontend" {
   zone_id = var.zone_id
   name = "roboshop.${var.domain_name}"
   type = "A"
   ttl = 1
   records = [aws_instance.roboshop[index(var.instances, "frontend")].public_ip] 
}