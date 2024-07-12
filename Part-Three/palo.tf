module "paloalto_security_policy" {
  source           = "./palo-module"
  device_group     = "DEMO"
  source_zone      = ["Inside"]
  destination_zone = ["DMZ"]
  rules = [
    {
      name        = "rule-1"
      source      = ["any"]
      destination = ["10.10.10.1/32", "10.10.10.2/32"]
      services    = ["tcp-80", "tcp-443", "tcp-8080"]
      application = ["any"]
    },
    {
      name        = "rule-2"
      source      = ["any"]
      destination = ["10.10.10.10/32"]
      services    = ["any"]
      application = ["any"]
    }
  ]
}