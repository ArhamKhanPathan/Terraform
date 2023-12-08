output "eip" {

    value = "${aws_eip.terraform.public_ip}"
  
}
output "security" {

    value = "${aws_security_group.all.id}"
  
}

output "ip" {
    value = "${aws_instance.my_instance.public_ip}"
  
}