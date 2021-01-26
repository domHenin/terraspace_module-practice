# Output: Elastic IP: Web-server public ip
output "public_ip" {
    value = aws_eip.elasticIP.public_ip 
}