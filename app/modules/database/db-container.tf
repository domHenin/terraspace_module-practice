# Resource: Database Instance
resource "aws_instance" "db_container" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"

    tags = {
        Name = "Database Container"
    }
}