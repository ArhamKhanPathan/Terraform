output "publicip" {
    value = "${aws_instance.appserver.public_ip}"
}