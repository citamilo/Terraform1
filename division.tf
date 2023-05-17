########################################################################
#                      Archivo de Divisiones Creadas                   #
########################################################################

resource "genesyscloud_auth_division" "Terraform_Pruebas" {
  count = 0
  name        = "CasoDeuso_1"
  description = "Custom Division para pruebas"

}