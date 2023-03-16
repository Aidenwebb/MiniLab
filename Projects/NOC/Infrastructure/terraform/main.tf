resource "proxmox_vm_qemu" "reverseproxy" {

  name  = lower(format("%s-%s-%02s", local.environment_code, var.project_shortcode, count.index + 1))
  count = 1

  target_node = local.target_node
  clone       = "template-ubuntu-2204"
  full_clone  = true

  agent    = 1
  os_type  = "cloud-init"
  cores    = 2
  sockets  = 1
  cpu      = "host"
  memory   = 4096
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  ipconfig0 = "ip=192.168.1.121/24,gw=192.168.1.1"

  disk {
    storage = "local-vmdata"
    type    = "scsi"
    size    = "50G"
    ssd     = 1
    discard = "on"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"

  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

}
