resource "proxmox_lxc" "postgres" {
  target_node  = "pve-edg2-01"
  hostname     = "dev-postgres"
  ostemplate   = "NAS-MiniLab:vztmpl/debian-11-turnkey-postgresql_17.1-1_amd64.tar.gz"
  password     = var.vm_root_password
  unprivileged = true
  onboot       = true
  swap         = 512
  memory       = 512

  features {
    nesting = true
  }

  rootfs {
    storage = "local-vmdata"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "192.168.1.130/24"
    gw     = "192.168.1.1"
  }
}
