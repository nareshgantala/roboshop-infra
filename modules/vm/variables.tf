variable "database_components" {
  type = map(any)
  default = {
    "mongodb"  = "t3.medium"
    "mysql"    = "t3.medium"
    "valkey"   = "t3.medium"
    "rabbitmq" = "t3.medium"
  }
}


variable "sg_id" {
  type = string
}

variable "project" {
  type = string
}

variable "env" {
  type = string
}
