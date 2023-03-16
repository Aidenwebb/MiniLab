locals {
  target_node = var.environment == "Production" ? "pve-edg2-01" : var.environment == "Sandbox" ? "pve-edg2-03" : "pve-edg2-02"
}

locals {
  environment_code = local.environment_dict[var.environment]
}

locals {
  environment_dict = {
    "Production"  = "p"
    "Test"        = "t"
    "Development" = "d"
    "UAT"         = "u"
    "QA"          = "q"
    "Sandbox"     = "s"
  }
}
