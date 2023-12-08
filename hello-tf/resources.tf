resource "aws_security_group" "all" {
    name = "allow_all"
    description = "Allow all inbound traffic"

    ingress {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }

    tags = {
        Name = "allow_all"
    }
}

# resource "aws_ebs_volume" "example" {

#     availability_zone = "ap-south-1"
#     size = "2"

#     tags = {
#       Name = "TerraformEx"
#     }
  
# }

resource "aws_eip" "terraform" {

    tags = {
      Name="TerraformEIP"
    }
  
}

resource "aws_instance" "my_instance" {
    ami               = "${var.myami}"
    availability_zone = "${var.myzone}"
    instance_type = "t2.micro"
}