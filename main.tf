terraform {
  required_version = "~> 1.3.7"
  required_providers {
    genesyscloud = {
      source  = "mypurecloud/genesyscloud"
    }
  }
}

provider "genesyscloud"{}

resource "genesyscloud_tf_export" "export" {
  directory          = "./genesyscloud"
  resource_types     = ["genesyscloud_user"]
  include_state_file = true
}




