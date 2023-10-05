data "azurerm_client_config" "current" {}

module "resource_group" {
  # source                                    = "git::git@ssh.dev.azure.com:v3/royalhorticulturalsociety/RHS%20DevOps/rhs-infra-cloud//az-cloud-modules/resourcegroup"
  source                                      = "git@github.com:techslateramu/terraform-modules//azure/resourcegroup"
  environment                                 = var.environment
  location                                    = var.location
  main_project                                = var.main_project
  sub_project                                 = var.sub_project
  tags                                        = merge(var.tags, var.specific_tags)
}