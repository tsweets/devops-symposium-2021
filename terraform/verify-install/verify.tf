terraform {
  required_version = ">= 0.14"

  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = ">=1.0.0"
    }
  }
}

provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = "https://proxmox.skyline.lan:8006/api2/json"
    # Change to export PM_PASS=password
    pm_password = "password"
    pm_user = "terraform@pve"
}

resource "proxmox_lxc" "lxc-test" {
    hostname = "terraform-new-container"
    network {
        name = "eth0"
        bridge = "vmbr0"
        ip = "dhcp"
        
    }

    rootfs {
        storage = "local-lvm"
        size    = "8G"
    }
    ostemplate = "local:vztmpl/ubuntu-18.04-standard_18.04.1-1_amd64.tar.gz"
    password = "password"
    target_node = "proxmox"
    unprivileged = true
   
}