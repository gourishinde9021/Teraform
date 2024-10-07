variable "ami_value" {
  description = "Value for ami"
}

variable "instance_type_value" {
  description = "value for instance type"
  type = map(string)
}
