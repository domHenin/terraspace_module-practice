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

output "sg_name" {
    value = aws_security_group.web_serverSG.name
}