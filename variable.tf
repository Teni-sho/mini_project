variable "ami" {
    default = "ami-0c7217cdde317cfec"
    type = string
}

variable "type" {
    default = "t2.micro"
    type = string
}

variable "key_pair" {
    default = " root-server2-london "
}

variable "availability_zone" {
    type = map(any)
    default = {
       "a" = "eu-west-2a"
       "b" = "eu-west-2b"  
    }

}