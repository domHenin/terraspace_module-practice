# Resoruce: Elastic IP
resource "aws_eip" "elasticIP" {
    insance = aws_instance.ws-container.id
    vpc = true
}