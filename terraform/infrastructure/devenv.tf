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

resource "proxmox_lxc" "lxc-gitea" {
  hostname = "gitea.isactn.skyline.lan"
  network {
    name = "eth0"
    bridge = "vmbr0"
    ip = "10.220.1.155/24"
    gw = "10.220.1.1"
  }
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }
  ostemplate = "local:vztmpl/ubuntu-20.04-rootlogin_20.04-1_amd64.tar.gz"
  password = "password"
  target_node = "proxmox"
  unprivileged = true
  nameserver = "10.220.1.1"
  searchdomain = "isactn.skyline.lan"
  start = true
}

resource "proxmox_lxc" "lxc-jenkins" {
  hostname = "jenkins.isactn.skyline.lan"
  network {
    name = "eth0"
    bridge = "vmbr0"
    ip = "10.220.1.156/24"
    gw = "10.220.1.1"
  }
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }
  ostemplate = "local:vztmpl/ubuntu-20.04-rootlogin_20.04-1_amd64.tar.gz"
  password = "password"
  target_node = "proxmox"
  unprivileged = true
  nameserver = "10.220.1.1"
  searchdomain = "isactn.skyline.lan"
  start = true
}