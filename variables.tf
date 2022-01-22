variable "id_org_name" {
  type        = string
  description = "The Organization Name"
  default = "highgarden"
}
variable "id_org_name_short" {
  type        = string
  description = "Short Organization Name used for naming resources."
  default = "h8n"
  validation {
    condition = length(var.id_org_name_short) <= 6 && length(var.id_org_name_short) >= 2
    error_message = "Organization Short name must be between 2 and 6 characters, as it is part of ID 63 char limit."
  }
}
variable "id_org_name_tld" {
  type        = string
  description = "Organization TLD used to generate standard labels keys."
  default = "io"
}

variable "id_layer" {
  type        = string
  description = "Infrastructure layer of the resources, used to generate resource ID."
  validation {
    condition = length(var.id_layer) <= 6 && length(var.id_layer) >= 2
    error_message = "Infrastructure Layer name must be between 2 and 6 characters, as it is part of ID 63 char limit."
  }
}

variable "id_namespace" {
  type        = string
  description = "Namespace of generate resources, used to group resources of a team/sub-organization."
  default = "main"
  validation {
    condition = length(var.id_namespace) <= 6 && length(var.id_namespace) >= 2
    error_message = "Namespace must be between 2 and 6 characters, as it is part of ID 63 char limit."
  }
}
variable "id_stage" {
  type        = string
  description = "Stage of the resources, such as dev, test, prod, etc."
  validation {
    condition = length(var.id_stage) <= 6 && length(var.id_stage) >= 2
    error_message = "Stage name must be between 2 and 6 characters, as it is part of ID 63 char limit."
  }
}
variable "id_name" {
  type        = string
  description = "Name of the resources, used to generate resource ID."
  validation {
    condition = length(var.id_name) <= 6
    error_message = "Name must be between 2 and 6 characters, as it is part of ID 63 char limit."
  }
}
variable "id_component" {
  type        = string
  description = "Sub-component of the resources, used to generate resource ID. (default to empty string)"
  default = ""
}
variable "topology_region" {
  type        = string
  description = "Region of the resources, used to generate resource ID."
}
variable "topology_zone" {
  type        = string
  description = "Zone of the resources if applicable."
  default = ""
}

variable "managed_by" {
  type        = string
  description = "Name of the component that manages the resources. ( default to 'Terraform', possible values can be other IAC Tools if not managed by Terraform)"
  default     = "terraform"
}

variable "managed_by_ref" {
  type        = string
  description = "Reference of the location of the component that manages the resources. (Repo / Terraform State Path)"
}