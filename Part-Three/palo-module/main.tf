
# loop through the list of services that we need for all rules and create a service object for each
# this list was computed in locals.tf
# the name used for each service will be rule_name-service
# since we have assumed that the service will follow the format protocol-port, we can split the service string to get 
# the protocol and port
resource "panos_panorama_service_object" "objects" {
  for_each = {
    for service in local.all_services : "${service.rule_name}-${service.service}" => service
  }
  name             = each.key
  protocol         = element(split("-", each.value.service), 0)
  destination_port = element(split("-", each.value.service), 1)
}

# loop through the list of rules and create a security rule for each
resource "panos_security_rule_group" "rules" {
  for_each     = { for rule in var.rules : rule.name => rule }
  device_group = var.device_group
  rulebase     = "pre-rulebase"
  rule {
    name                  = each.value.name
    source_zones          = var.source_zone
    destination_zones     = var.destination_zone
    categories            = ["any"]
    source_users          = ["any"]
    source_addresses      = each.value.source
    destination_addresses = each.value.destination
    services = (each.value.services == tolist(["application-default"]) ? ["application-default"] :
      each.value.services == tolist(["any"]) ? ["any"] :
    [for service in each.value.services : panos_panorama_service_object.objects["${each.value.name}-${service}"].name])
    applications = each.value.application
  }
  depends_on = [panos_panorama_service_object.objects]
}