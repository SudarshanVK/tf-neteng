# Installs the required provider on init
terraform {
  required_providers {
    panos = {
      source  = "PaloAltoNetworks/panos"
      version = "1.11.1"
    }
  }
}

# Initialises the provider with the required credentials
provider "panos" {
  hostname           = var.PANOS_HOSTNAME
  username           = var.PANOS_USERNAME
  password           = var.PANOS_PASSWORD
  verify_certificate = var.VERIFY_CERTIFICATE
}