variable "myami" {

    type = string
    description = "AMI Id of your instance"
  
}

variable "myzone" {
    type        = string
    description = "Availability Zone for the EC2 Instance."
    default = "ap-south-1b"
  
}