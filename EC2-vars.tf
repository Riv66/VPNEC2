variable "keyp" {
  description = "Enter EC2 Key Pair Name:"
}

variable "tags" {
  type        = map(any)
  description = "Enter Resource Tags:"
}
