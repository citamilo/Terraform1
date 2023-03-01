# resource "genesyscloud_routing_queue" "IRA" {
#   name                              = "IRA"
#   division_id                       = genesyscloud_auth_division.Terraform_Pruebas.id
#   description                       = "Individual Retirement Accounts team"
#   acw_wrapup_prompt                 = "MANDATORY_TIMEOUT"
#   acw_timeout_ms                    = 300000
#   skill_evaluation_method           = "BEST"
#   auto_answer_only                  = true
#   enable_transcription              = true
#   enable_manual_assignment          = true
#   calling_party_name                = "Example Inc."
#   depends_on = [
#     genesyscloud_auth_division.Terraform_Pruebas
#   ]
#   #members {
#   #  user_id  = genesyscloud_user.daniel.sanchez.id
#   #  ring_num = 1
#   #}
# }

# resource "genesyscloud_routing_queue" "T401K" {
#   name                              = "401K"
#   division_id                       = genesyscloud_auth_division.Terraform_Pruebas.id
#   description                       = "401K team"
#   acw_wrapup_prompt                 = "MANDATORY_TIMEOUT"
#   acw_timeout_ms                    = 300000
#   skill_evaluation_method           = "BEST"
#   auto_answer_only                  = true
#   enable_transcription              = true
#   enable_manual_assignment          = true
#   calling_party_name                = "Example Inc."
#   depends_on = [
#     genesyscloud_auth_division.Terraform_Pruebas
#   ]
#    #members {
#    #  user_id  = genesyscloud_user.test_user.id
#    #  ring_num = 2
#    #}
# }

# resource "genesyscloud_routing_queue" "Retirement" {
#   name                              = "Retirement"
#   division_id                       = genesyscloud_auth_division.Terraform_Pruebas.id
#   description                       = "Retirement team"
#   acw_wrapup_prompt                 = "MANDATORY_TIMEOUT"
#   acw_timeout_ms                    = 300000
#   skill_evaluation_method           = "BEST"
#   auto_answer_only                  = true
#   enable_transcription              = true
#   enable_manual_assignment          = true
#   calling_party_name                = "Example Inc."
#   depends_on = [
#     genesyscloud_auth_division.Terraform_Pruebas
#   ]
#   # members {
#   #   user_id  = genesyscloud_user.test_user.id
#   #   ring_num = 2
#   # }
# }

# resource "genesyscloud_routing_queue" "Brokerage" {
#   name                              = "Brokerage"
#   division_id                       = genesyscloud_auth_division.Terraform_Pruebas.id
#   description                       = "Brokerage team"
#   acw_wrapup_prompt                 = "MANDATORY_TIMEOUT"
#   acw_timeout_ms                    = 300000
#   skill_evaluation_method           = "BEST"
#   auto_answer_only                  = true
#   enable_transcription              = true
#   enable_manual_assignment          = true
#   calling_party_name                = "Example Inc."
#   depends_on = [
#     genesyscloud_auth_division.Terraform_Pruebas
#   ]
#   # members {
#   #   user_id  = genesyscloud_user.test_user.id
#   #   ring_num = 2
#   # }
# }


# resource "genesyscloud_routing_queue" "Brokerage2" {
#   name                              = "Brokerage2"
#   division_id                       = genesyscloud_auth_division.Terraform_Pruebas.id
#   description                       = "Brokerage team2"
#   acw_wrapup_prompt                 = "MANDATORY_TIMEOUT"
#   acw_timeout_ms                    = 300000
#   skill_evaluation_method           = "BEST"
#   auto_answer_only                  = true
#   enable_transcription              = true
#   enable_manual_assignment          = true
#   calling_party_name                = "Example Inc."
#   depends_on = [
#     genesyscloud_auth_division.Terraform_Pruebas
#   ]
#   # members {
#   #   user_id  = genesyscloud_user.test_user.id
#   #   ring_num = 2
#   # }
# }