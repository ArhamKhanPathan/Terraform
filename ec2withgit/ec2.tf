
resource "aws_instance" "myec2" {

    ami = "${var.myami}"
    availability_zone = "${var.myzone}"
    instance_type = "${var.instance}"
    key_name = "${var.keyname}"
    
    connection {
        host = "aws"
        type = "ssh"
        user = "ubuntu-img-tomcat"
        private_key = "${  file("./tutorial-key.pem")}"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo apt update",
            "sudo apt install git -y",
        ]
    }
}

output "publicip" {
    value = "${aws_instance.myec2.public_ip}"
}