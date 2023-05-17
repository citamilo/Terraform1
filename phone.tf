########################################################################
#             Archivo de Telefonos y Linea Base Telefono               #
########################################################################

resource "genesyscloud_telephony_providers_edges_phone" "example_phone" {
  name                   = "terraform_phone"
  state                  = "active"
  site_id                = data.genesyscloud_telephony_providers_edges_site.site.id
  phone_base_settings_id = genesyscloud_telephony_providers_edges_phonebasesettings.PhoneBaseSettings.id
  # line_base_settings_id  = data.genesyscloud_telephony_providers_edges_linebasesettings.lineBaseSetting.id

  web_rtc_user_id        = genesyscloud_user.test_user.id

  capabilities {
    provisions            = false
    registers             = false
    dual_registers        = false
    allow_reboot          = false
    no_rebalance          = false
    no_cloud_provisioning = false
    cdm                   = true
    hardware_id_type      = "mac"
    media_codecs          = ["audio/opus"]
  }
  depends_on = [
    genesyscloud_telephony_providers_edges_phonebasesettings.PhoneBaseSettings,
    genesyscloud_auth_division.Terraform_Pruebas
  ]
}


resource "genesyscloud_telephony_providers_edges_phonebasesettings" "PhoneBaseSettings" {
  name               = "phone_base_settings_terraform"
  description        = "Sample description"
  phone_meta_base_id = "inin_webrtc_softphone.json"
  properties = jsonencode({
    "phone_label" = {
      "value" = {
        "instance" = "PureCloud WebRTC Softphone"
      }
    }
    "phone_maxLineKeys" = {
      "value" = {
        "instance" = 1
      }
    }
    "phone_media_codecs" = {
      "value" = {
        "instance" =  ["audio/opus"]
      }
    }
    "phone_media_dscp" = {
      "value" = {
        "instance" = 46
      }
    }
    "phone_sip_dscp" = {
      "value" = {
        "instance" = 24
      }
    }               
  })

}