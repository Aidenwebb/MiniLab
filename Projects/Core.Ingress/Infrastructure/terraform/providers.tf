terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.13"
    }
  }
}

provider "proxmox" {
  # Configuration options
  pm_api_url = "https://pve-edg2-01.homelan.win:8006/api2/json"
  pm_debug   = true
}
