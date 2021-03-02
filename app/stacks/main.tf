# Provider: AWS
provider "aws" {
    region = var.aws_region
}

module "database" {
    source = "../modules/databse"
}

module "web" {
    source = "../modules/web"

}

output "private_ip" {
    value = module.db_container.private_ip
}

output "public_ip" {
    value = module.ws-container.pub_ip
}