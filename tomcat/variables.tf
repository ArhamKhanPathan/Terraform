variable "myami" {
    type = string
    default = "ami-0f5ee92e2d63afc18"
}

variable "myzone" {
    type = string
    default = "ap-south-1b"
}

variable "instance" {
    type        = string
    default = "t2.micro"
  
}

variable "keyname" {
    type    = string
    default = "tutorial-key"
  
}