# Variable
variable "instance_id" {
    type = string
}

# Resource EIP
resource "aws_eip" "web_ip" {
    instance = var.instance_id
}

# Output: public IP
output "public_ip" {
    value = aws_eip.elasticIP.public_ip
}