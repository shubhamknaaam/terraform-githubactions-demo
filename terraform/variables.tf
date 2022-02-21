variable "region" {
  type    = string
  default = "eastus2"
}

variable "environment" {
  type    = string
  default = "uat"
}

variable "vm_size" {
  type    = string
  default = "Standard_DS1_v2"
}

variable "comp_name" {
  type    = string
  default = "devops-demovm1"
}

variable "admin_username" {
  type    = string
  default = "bhsadmin"
}

variable "resource_group_name" {
  type    = string
  default = ""
}

variable "storage_account_name" {
  type    = string
  default = ""
}

variable "key" {
  type    = string
  default = ""
}

variable "container_name" {
  type    = string
  default = ""
}

variable "pwd" {
  type      = string
  default   = "Password1234!"
  sensitive = true
}

variable "address_space" {
  description = "VNET address_space"
  type        = list(any)
  default     = ["192.168.0.0/16"]
}

variable "address_prefix" {
  description = "subnet range / mask"
  type        = list(any)
  default     = ["192.168.0.0/24"]
}

# Standards Maps

variable "regions" {
  type        = map(any)
  description = "Validated regions in Azure CSP"
  default = {
    eastus    = { name = "East US", prefix = "eus" }
    eastus2   = { name = "East US2", prefix = "eus2" }
    centralus = { name = "Central US", prefix = "cus" }
  }
}

variable "environments" {
  type        = map(any)
  description = "Env Ref"
  default = {
    development = "dev"
    uat         = "uat"
    production  = "prod"
  }
}
