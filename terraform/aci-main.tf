data "azurerm_client_config" "current" {}

module "resource_group" {
  source                                      = "../modules/resourcegroup"
  environment                                 = var.environment
  location                                    = var.location
  main_project                                = var.main_project
  sub_project                                 = var.sub_project
  tags                                        = merge(var.tags, var.specific_tags)
}


module "aci" {
  source              = "../modules/aci"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
}