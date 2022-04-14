variable "name" {
    type = string
    default = "new"
}

variable "cidr_block" {
    type = string 
    default = "100.64.0.0/16"
}

variable "public_cidr" {
    type = string
    default = "100.64.0.0/24"
}

variable "private_cidr" {
    type = string
    default = "100.64.3.0/24"
}

variable "az" {
    type    = string
    default =  "us-east-1a"
}