########################################################################################################
#     Archivo principal de conexión terraform Genesys                                                  #
#     Este Proyecto configura un agente con su telefono en genesys cloud y asignación a una cola       #
#                                                                                                      #
########################################################################################################

terraform {
  required_version = "~> 1.3.7"
  required_providers {
    genesyscloud = {
      source = "MyPureCloud/genesyscloud"
      version = "1.11.1"
    }
  }
  backend "local" {
    path = "/gcti/terraform/tfstate/terraform.tfstate"
  }


}

provider "genesyscloud"{}

resource "genesyscloud_tf_export" "export" {
  directory          = "./genesyscloud"
  resource_types     = ["genesyscloud_user"]
  include_state_file = false
}






