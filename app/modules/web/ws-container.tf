# Resource: Web-server 
resource "aws_instance" "ws-container" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"
    security_group = [aws_security_group.web_serverSG.name]

    connection {
        type = "ssh"
        user = "admin"
    }

    user_data = file(./files)

    tags = {
        Name = "Web-server" 
    }
}


# Resource: Security Group
resource "aws_security_group" "web_serverSG" {
    name = "allow-HTTP"

    dynamic "ingress" {
        iterator = port
        for_each = var.ingress_rules
        content {
            to_port = port.value
            from_port = port.value
            protocol = "TCP"
            cidr_block = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        iterator = port
        for_each = var.egress_rules
        content {
            to_port = port.value
            from_port = port.value
            protocol = "TCP"
            cidr_block = ["0.0.0.0/0"]
        }
    }
}