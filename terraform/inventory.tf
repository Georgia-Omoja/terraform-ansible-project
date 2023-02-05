resource "local_file" "ip_address" {
   # input the path of the host inventory file. 
    filename = "/home/vagrant/terraform-ansible-project/ansible/host-inventory"
    content  = <<EOT
    [all]
    ${aws_instance.webserver-1.public_ip}
    ${aws_instance.webserver-2.public_ip}
    ${aws_instance.webserver-3.public_ip}
        EOT
}