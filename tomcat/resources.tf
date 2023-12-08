resource "aws_instance" "appserver" {

    ami = "${var.myami}"
    availability_zone = "${var.myzone}"
    instance_type = "${var.instance}"
    key_name = "${var.keyname}"
    vpc_security_group_ids = ["${aws_security_group.all.id}"]
    
    connection {
        host = "${aws_instance.appserver.public_ip}"
        type = "ssh"
        user = "ubuntu-img-tomcat"
        private_key = "${file("./tutorial-key.pem")}"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo apt-get update",
            "sudo apt-get install tomcat7 -y",
        ]
    }
}

resource "aws_security_group" "all" {
    name = "appserver"
    description = "Allow all inbound traffic"

    ingress {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_all"
    }
}