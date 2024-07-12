locals {
  # Create a list of dictionaries with rule names as keys and services as values
  all_services = flatten([
    for rule in var.rules : [
      for service in rule.services : {
        rule_name = rule.name
        service   = service
      } if service != "any" && service != "application-default"
    ]
  ])
}