resource "aws_instance" "min-1" {
    ami = var.ami
    instance_type = var.type 
    key_name = var.key_pair
    security_groups = [aws_security_group.min-security-grp-rule.id]
    subnet_id = aws_subnet.min-public-subnet1.id
    availability_zone = var.availability_zone["a"]

    connection {
        type = "ssh" 
        host = "self.public_ip"
        user = "ubuntu" 
        private_key = file ("/root/terraform/londonkey2.pem")
    }

    tags = {
        name = "min-1" 
        sorce = "terraform"
    }
}

resource "aws_instance" "min-2" {
    ami = var.ami
    instance_type = var.type 
    key_name = var.key_pair
    security_groups = [aws_security_group.min-security-grp-rule.id]
    subnet_id = aws_subnet.min-public-subnet2.id
    availability_zone = var.availability_zone["b"]

    connection {
        type = "ssh" 
        host = "self.public_ip"
        user = "ubuntu" 
        private_key = file ("/root/terraform/londonkey2.pem")
    }

    tags = {
        name = "min-2" 
        sorce = "terraform"
    }
}


resource "aws_instance" "min-3" {
    ami = var.ami
    instance_type = var.type
     key_name = var.key_pair
    security_groups = [aws_security_group.min-security-grp-rule.id]
    subnet_id = aws_subnet.min-public-subnet1.id
    availability_zone = var.availability_zone["a"]

    connection {
        type = "ssh" 
        host = "self.public_ip"
        user = "ubuntu" 
        private_key = file ("/root/terraform/londonkey2.pem")
    }

    tags = {
        name = "min-3" 
        sorce = "terraform"
    }

resource "local_file"  "ip_address" {
    filename = "/home/ubuntu/terraform/ansible-playbook/host-inventory"
    content = <<EOT 
    $(aws_instance.min-1.public_ip)
    $(aws_instance.min-2.public_ip)
    $(aws_instance.min-3.public_ip)
    EOT
}

}
