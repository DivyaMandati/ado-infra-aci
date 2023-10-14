provider "azurerm" {
  features {}
}

module "aci" {
  source              = "Azure/aci/azurerm"
   version             = "1.0.0"
  resource_group_name = var.resource_group_name
  location            = var.location

  containers = [{
    name   = "my_container"
    image  = "linuxramu/calc:2.5"
    cpu    = "0.5"
    memory = "1.5 Gi"
  }]

  os_type = "Linux"
  tags = {
    environment = "development"
  }

  dns_config = {
    name_servers = local.name_servers
    options      = local.dns_options
  }
}

locals {
  name_servers = [
    "8.8.8.8",   # Example DNS server
    "8.8.4.4"    # Example DNS server
  ]

  dns_options = [
    "ndots:5",
    "timeout:2"
  ]
}

