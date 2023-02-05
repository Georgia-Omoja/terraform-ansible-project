output "public_ip" {
    value = aws_instance.webserver-1.public_ip
}

output "public_ip" {
    value = aws_instance.webserver-2.public_ip
}

output "public_ip" {
    value = aws_instance.webserver-3.public_ip
}

output "instance_app-server1_public_dns" {
   value = aws_instance.webserver-1.public_dns
}
output "instance_app-server2_public_dns" {
   value = aws_instance.webserver-2.public_dns
}
output "instance_app-server3_public_dns" {
   value = aws_instance.webserver-3.public_dns
}
output "load_balancer_dns_name" {
  value = aws_lb.alb.dns_name
}