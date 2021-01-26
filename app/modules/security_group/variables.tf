# Variable: Ingress Rules
variable "ingress_rules" {
    type = list(number)
    default = [80, 443]
}

# Variable: Egress Rules
variable "egress_rules" {
    type = list(number)
    default = [80, 443]
}