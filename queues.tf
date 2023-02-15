resource "genesyscloud_routing_queue" "IRA3" {
  name                              = "IRA1"
  description                       = "Individual Retirement Accounts team"
  acw_wrapup_prompt                 = "MANDATORY_TIMEOUT"
  acw_timeout_ms                    = 300000
  skill_evaluation_method           = "BEST"
  auto_answer_only                  = true
  enable_transcription              = true
  enable_manual_assignment          = true
  calling_party_name                = "Example Inc."

  members {
    user_id  = genesyscloud_user.robert_smith.id
    ring_num = 1
  }
}

resource "genesyscloud_routing_queue" "T401K3" {
  name                              = "401K1"
  description                       = "401K team"
  acw_wrapup_prompt                 = "MANDATORY_TIMEOUT"
  acw_timeout_ms                    = 300000
  skill_evaluation_method           = "BEST"
  auto_answer_only                  = true
  enable_transcription              = true
  enable_manual_assignment          = true
  calling_party_name                = "Example Inc."

  # members {
  #   user_id  = genesyscloud_user.test_user.id
  #   ring_num = 2
  # }
}

resource "genesyscloud_routing_queue" "Retirement" {
  name                              = "Retirement1"
  description                       = "Retirement team"
  acw_wrapup_prompt                 = "MANDATORY_TIMEOUT"
  acw_timeout_ms                    = 300000
  skill_evaluation_method           = "BEST"
  auto_answer_only                  = true
  enable_transcription              = true
  enable_manual_assignment          = true
  calling_party_name                = "Example Inc."

  # members {
  #   user_id  = genesyscloud_user.test_user.id
  #   ring_num = 2
  # }
}

resource "genesyscloud_routing_queue" "Brokerage" {
  name                              = "Brokerage1"
  description                       = "Brokerage team"
  acw_wrapup_prompt                 = "MANDATORY_TIMEOUT"
  acw_timeout_ms                    = 300000
  skill_evaluation_method           = "BEST"
  auto_answer_only                  = true
  enable_transcription              = true
  enable_manual_assignment          = true
  calling_party_name                = "Example Inc."

  # members {
  #   user_id  = genesyscloud_user.test_user.id
  #   ring_num = 2
  # }
}