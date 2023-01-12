variable "region" {

  description = "Defined region us-east-1"
  type = string
  default = "us-east-1"

}

variable "bool_true" {
  description = "Boolean variable with value true"
  type = bool
  default = true
}

variable "ami" {
  description = "ami for Ubuntu Server 20.4 LTS SSD"
  type = string
  default = "ami-0b93ce03dcbcb10f6"
}

variable "instance_type-1" {
  description = "t2-micro instance type"
  type = string
  default = "t2.micro"
}