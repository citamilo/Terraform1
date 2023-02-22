resource "genesyscloud_user" "test_user" {
  email           = "john.carnell@example.com"
  name            = "John  Carnell"
  password        = "I@m@Batm@n2"
  division_id     = genesyscloud_auth_division.Terraform_Pruebas.id  
  state           = "active"
  department      = "Development"
  title           = "Executive Director"
  acd_auto_answer = true
  profile_skills  = ["Java", "Go"]
  certifications  = ["Certified Developer"]
  addresses {
    other_emails {  
      address = "john@gmail.com"
      type    = "HOME"
    }
    phone_numbers {
      number     = "9202655555"
      media_type = "PHONE"
      type       = "MOBILE"
    }
  }
  employer_info {
    official_name = "Jonathon Doe"
    employee_id   = "12345"
    employee_type = "Full-time"
    date_hire     = "2021-03-18"
  }
  depends_on = [
    genesyscloud_auth_division.Terraform_Pruebas
  ]

}

