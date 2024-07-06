variable "PANOS_HOSTNAME" {
  description = "The hostname for the PANOS provider"
  type        = string
}

variable "PANOS_USERNAME" {
  description = "The username for the PANOS provider"
  type        = string
}

variable "PANOS_PASSWORD" {
  description = "The password for the PANOS provider"
  type        = string
  sensitive   = true
}

variable "VERIFY_CERTIFICATE" {
  description = "Whether to verify the certificate"
  type        = bool
  default     = false
}
