resource "proxmox_lxc" "reverseproxy" {
  target_node  = "pve-edg2-01"
  hostname     = "core-reverseproxy"
  ostemplate   = "NAS-MiniLab:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  password     = var.vm_root_password
  start        = true
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

  mountpoint {
    key     = "0"
    slot    = 0
    storage = "NAS-MiniLabNfs"
    mp      = "/mnt/container/persistent_data"
    size    = "12G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "192.168.1.3/24"
    gw     = "192.168.1.1"
  }
}
