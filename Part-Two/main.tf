# Creates an address group ntp1 on panorama
resource "panos_address_object" "ao1" {
  name  = "ntp1"
  value = "10.0.0.1"
}

# Creates an address group ntp2 on panorama
resource "panos_address_object" "ao2" {
  name  = "ntp2"
  value = "10.0.0.2"
}

# Creates a security policy on panorama that allows DNS traffic from Inside to DMZ
# for destination address, we are using the address objects created above and
# we are referencing them using the terraform interpolation syntax
# panos_address-object ==> resource name
# ao1 ==> resource name
# name ==> attribute name
resource "panos_security_policy" "rule1" {
  device_group = "DEMO"
  rule {
    name                  = "DNS Policy"
    source_zones          = ["Inside"]
    source_addresses      = ["any"]
    source_users          = ["any"]
    destination_zones     = ["DMZ"]
    destination_addresses = [panos_address_object.ao1.name, panos_address_object.ao2.name]
    applications          = ["dns"]
    services              = ["application-default"]
    categories            = ["any"]
    action                = "allow"
  }
}
