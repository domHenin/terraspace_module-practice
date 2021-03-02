# Resource: Web-server 
resource "aws_instance" "ws-container" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"
    security_group = [module.sg.sg_name]

    connection {
        type = "ssh"
        user = "admin"
    }

    user_data = file(./files)

    tags = {
        Name = "Web-server" 
    }
}

module "eip" {
    source = "../elastic_ip"
    instance_id = aws_instance.web.id
}

# Deleted thank to line 21
// output "instance_id" {
//     value = aws_instance.web.id
// }

module "sg" {
    source = "../security_group"
    instance_id = 
}

output "pub_ip" {
    value = module.eip.public_ip
}