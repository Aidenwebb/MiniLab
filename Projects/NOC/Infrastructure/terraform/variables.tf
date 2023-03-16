variable "project_name" {
  type        = string
  description = "The project name"
}

variable "project_shortcode" {
  type        = string
  description = "The project shortcode"
}

variable "environment" {
  type        = string
  description = "The environment name for all resources in this module."
  validation {
    condition     = contains(["Production", "Test", "Development", "UAT", "QA", "Sandbox"], var.environment)
    error_message = "The environment name must be one of: Production / Test / Development / UAT / QA / Sandbox"
  }
}

variable "vm_root_password" {
  type        = string
  description = "The root password for the VM"
}
