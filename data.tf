####################################################################
#      Consulta objeto site con nombre "Laboratorio Piso 10"       #
####################################################################  
 data "genesyscloud_telephony_providers_edges_site" "site" {
   name = "Laboratorio Piso 10"
 }

