# Define resources
module "agent_services" {
  for_each                  = toset(local.resource_locations)
  source                    = "github.com/wesley-trust/tfmodule-compute?ref=v1.4-compute"
  service_environment       = terraform.workspace
  service_deployment        = var.service_deployment
  service_name              = var.service_name
  service_location          = each.value
  resource_name             = local.resource_name
  resource_instance_count   = local.resource_instance_count
  resource_instance_size    = local.resource_instance_size
  resource_address_space    = lookup(var.resource_address_space, each.value, null)
  resource_network_role     = var.resource_network_role
  operating_system_platform = var.operating_system_platform
  provision_scale_set       = var.provision_scale_set
}
