# Define the required providers
terraform {
  required_providers {
    panos = {
      source  = "PaloAltoNetworks/panos"
      version = "1.11.1"
    }
  }
}