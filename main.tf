locals {
  common_tags = {
    Owner = "DevOps Team"
    service = "backend"
  }
}

variable "listval" {
  type = list
  default = ["a",5,true]
}

output "lcl" {
  value = local.common_tags["Owner"]
}

output "lst" {
  value = var.listval[*]
}
