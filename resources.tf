# Define resources
module "agent_services_linux" {
  for_each                  = toset(local.resource_locations)
  source                    = "github.com/wesley-trust/tfmodule-compute?ref=v1.8-compute"
  service_environment       = terraform.workspace
  service_deployment        = var.service_deployment
  service_name              = "${var.service_name}-Lin"
  service_location          = each.value
  resource_name             = lookup(local.resource_name, "Linux", null)
  operating_system_platform = "Linux"
  resource_image            = lookup(var.resource_image, "Linux", null)
  resource_image_group      = lookup(var.resource_image_group, "Linux", null)
  resource_disk_size        = lookup(var.resource_disk_size, "Linux", null)
  resource_instance_count   = local.resource_instance_count
  resource_instance_size    = local.resource_instance_size
  resource_network_role     = var.resource_network_role
  resource_address_space    = lookup(var.resource_address_space, each.value, null)
  provision_scale_set       = var.provision_scale_set
  ephemeral_disk_enabled    = var.ephemeral_disk_enabled
}

module "agent_services_windows" {
  for_each                  = toset(local.resource_locations)
  source                    = "github.com/wesley-trust/tfmodule-compute?ref=v1.8-compute"
  service_environment       = terraform.workspace
  service_deployment        = var.service_deployment
  service_name              = "${var.service_name}-Win"
  service_location          = each.value
  resource_name             = lookup(local.resource_name, "Windows", null)
  operating_system_platform = "Windows"
  resource_image            = lookup(var.resource_image, "Windows", null)
  resource_image_group      = lookup(var.resource_image_group, "Windows", null)
  resource_disk_size        = lookup(var.resource_disk_size, "Windows", null)
  resource_instance_count   = local.resource_instance_count
  resource_instance_size    = local.resource_instance_size
  resource_network_role     = var.resource_network_role
  resource_address_space    = lookup(var.resource_address_space, each.value, null)
  provision_scale_set       = var.provision_scale_set
}
