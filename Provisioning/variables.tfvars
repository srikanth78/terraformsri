/* Hyd-->Dev-->env variables */
resource_prefix               = "internal.dev.azure"
location                      = "East US"
/* virtual_network_name          = "dev.digital_dev" */
/* subnet_name                   = ["terraform","devs"] */
/* virtual_network_address_space = "10.10.0.0/15" */
/* subnet_address_space          = ["10.10.0.0/20"] */

tags = {
  environment            = "Dev"
  cost_center_code       = ""
  created_month_and_year = "Sep-2020"
  pricing_model          = "RI"
  project_name           = "Terraform Trial"
  project_owner          = "Srikanth"
  subscription           = "Cloud Practice StaaS ( 201473 )"
}
