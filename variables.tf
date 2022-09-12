# Define variables
variable "service_name" {
  description = "Desired name for the provisioned resources"
  type        = string
  default     = "AgentServices"
}

variable "service_location" {
  description = "The production resource locations to deploy"
  type        = map(any)
  default = {
    Prod = [
      "UK South"
    ]
    default = [
      "UK South"
    ]
  }
}

variable "service_deployment" {
  description = "Desired deployment identifier of the service collection of provisioned resources"
  type        = string
  default     = "01"
}

variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = map(string)
  default = {
    "AgentServices" = "DEVOPS"
  }
}

variable "operating_system_platform" {
  description = "Desired OS for the provisioned resources"
  type        = string
  default     = "Linux"
}

variable "resource_instance_count" {
  description = "Desired number of the provisioned resources for each service environment"
  type        = map(any)
  default = {
    Prod = {
      "AgentServices" = 0
    },
    default = {
      "AgentServices" = 0
    },
  }
}

variable "resource_instance_size" {
  description = "Desired size for the provisioned resources for each service"
  type        = map(any)
  default = {
    Prod = {
      "AgentServices" = "Standard_D4as_v4"
    },
    default = {
      "AgentServices" = "Standard_D4as_v4"
    }
  }
}

variable "resource_address_space" {
  description = "Desired address space for the provisioned resources"
  type        = map(string)
  default = {
    "UK South" = "10.0.2.0/24"
  }
}

variable "resource_network_role" {
  description = "The network type for peering"
  type        = string
  default     = "spoke"
}

variable "resource_network_peer_role" {
  description = "The network type for peering"
  type        = string
  default     = "hub"
}

variable "resource_network_peer_deployment" {
  description = "Deployment identifier for the resource network to peer"
  type        = string
  default     = "01"
}

variable "provision_scale_set" {
  description = "Whether to provision a key vault"
  type        = bool
  default     = true
}

variable "resource_vm_sku" {
  description = "Desired sku for the provisioned resources"
  type        = string
  default     = "18.04-LTS"
}

variable "ephemeral_disk_enabled" {
  description = "Whether to use a ephemeral OS disk the provisioned resources"
  type        = bool
  default     = true
}

variable "resource_image_linux" {
  description = "Desired image for the provisioned resources"
  type        = string
  default     = "Image-Linux"
}

variable "resource_image_linux_group" {
  description = "Resource group name of image for the provisioned resources"
  type        = string
  default     = "pkrrunngerimagebuild1172526797"
}