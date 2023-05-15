 data "genesyscloud_telephony_providers_edges_site" "site" {
   name = "Laboratorio Piso 10"
 }

 output "foo" {
   value=data.genesyscloud_telephony_providers_edges_site.site
 }