########################################################################
#         Archivo de Creación de Colas y Sus Caracteristicas           #
########################################################################

resource "genesyscloud_routing_queue" "terraform_queue" {
  name                              = "terraform_queue"
  division_id                       = genesyscloud_auth_division.Terraform_Pruebas.id
  description                       = "Individual Retirement Accounts team"
  acw_wrapup_prompt                 = "MANDATORY_TIMEOUT"
  acw_timeout_ms                    = 300000
  skill_evaluation_method           = "BEST"
  auto_answer_only                  = true
  enable_transcription              = true
  enable_manual_assignment          = true
  calling_party_name                = "Example Inc."
  depends_on = [
    genesyscloud_auth_division.Terraform_Pruebas
  ]
  members {
   user_id  = genesyscloud_user.test_user.id
   ring_num = 1
  }
}

