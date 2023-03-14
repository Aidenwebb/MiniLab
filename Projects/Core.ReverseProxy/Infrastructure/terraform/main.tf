resource "proxmox_lxc" "reverseproxy" {
  target_node  = "pve-edg2-01"
  hostname     = "core-reverseproxy"
  ostemplate   = "NAS-MiniLab:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  password     = var.vm_root_password
  start        = true
  unprivileged = false
  onboot       = true
  swap         = 512
  memory       = 512

  rootfs {
    storage = "local-vmdata"
    size    = "8G"
  }

  // need to set features in GUI as root to enable NFS/Nesting

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "192.168.1.4/24"
    gw     = "192.168.1.1"
  }
}
