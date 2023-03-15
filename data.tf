########################################################################
#     Archivo de Objetos Previamente Existentes Extraidos Genesys      #
########################################################################

data "genesyscloud_telephony_providers_edges_site" "site" {
  name = "Laboratorio Piso 10"
}

data "genesyscloud_telephony_providers_edges_linebasesettings" "lineBaseSetting" {
  name = "phone_base_settings_terraform"
  depends_on = [
    genesyscloud_telephony_providers_edges_phonebasesettings.PhoneBaseSettings,
    genesyscloud_auth_division.Terraform_Pruebas
  ]
}

output "foo" {
  value=data.genesyscloud_telephony_providers_edges_linebasesettings.lineBaseSetting
}

