resource "genesyscloud_routing_queue" "IRA" {
  name                              = "IRA"
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
  #members {
  #  user_id  = genesyscloud_user.daniel.sanchez.id
  #  ring_num = 1
  #}

}

