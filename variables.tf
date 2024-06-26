#variables.tf
variable "access_key" {
    description = "Access key to aws console"
}

variable "secret_key" {
    description = "Secret key to aws console"
}

variable "region" {
    description = "AWS region"
    default = "us-east-1"
}