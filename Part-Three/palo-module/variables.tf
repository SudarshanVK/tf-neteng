variable "device_group" {
  description = "The device group to which the security policy belongs"
  type        = string
}

variable "source_zone" {
  description = "The source zone for the security policy"
  type        = list(any)
}

variable "destination_zone" {
  description = "The destination zone for the security policy"
  type        = list(any)
}

variable "rules" {
  description = "The security rules for the security policy"
  type = list(object({
    name        = string
    source      = list(string)
    destination = list(string)
    services    = list(string)
    application = list(string)
  }))
  default = []
}