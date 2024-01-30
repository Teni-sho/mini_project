variable "ami" {
  default =  "ami-0e5f882be1900e43b"
  type    = string
}

variable "type" {
  default = "t2.micro"
  type    = string
}

variable "key_pair" {
  default = "londonkey2"
}

/* variable "subnet_group" {
  type = map(any)
  default = {
    "public1" = aws_subnet.min-public-subnet1.id
    "public2" = aws_subnet.min-public-subnet2.id
  }
} */

variable "availability_zone" {
  type = map(any)
  default = {
    "a" = "eu-west-2a"
    "b" = "eu-west-2b"
  }
}