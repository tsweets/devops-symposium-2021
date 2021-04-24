terraform {
  required_providers {
    vmworkstation = {
      source  = "elsudano/vmworkstation"
      version = "0.2.1"
    }
  }
  required_version = ">= 0.14.5"
}

provider "vmworkstation" {
  user = "test"
  password = "P@ssw0rd"
  url = "http://localhost:8697/api"
  https = false
  debug = true

}

resource "vmworkstation_vm" "test_machine" {
  sourceid     = "QTR6F6BLLM7EVP62S4GIMKL4CJ5RJE83"
  denomination = "NewInstance"
  description  = "TestBox"
  path         = "/home/tsweets/vmware/NewInstance/NewInstance.vmx"
  processors   = "2"
  memory       = "1024"
}



//resource "proxmox_lxc" "lxc-gitea" {
//  hostname = "gitea.isactn.skyline.lan"
//  network {
//    name = "eth0"
//    bridge = "vmbr0"
//    ip = "10.220.1.155/24"
//    gw = "10.220.1.1"
//  }
//  rootfs {
//    storage = "local-lvm"
//    size    = "8G"
//  }
//  ostemplate = "local:vztmpl/ubuntu-20.04-rootlogin_20.04-1_amd64.tar.gz"
//  password = "password"
//  target_node = "proxmox"
//  unprivileged = true
//  nameserver = "10.220.1.1"
//  searchdomain = "isactn.skyline.lan"
//  start = true
//}
//
//resource "proxmox_lxc" "lxc-jenkins" {
//  hostname = "jenkins.isactn.skyline.lan"
//  network {
//    name = "eth0"
//    bridge = "vmbr0"
//    ip = "10.220.1.156/24"
//    gw = "10.220.1.1"
//  }
//  rootfs {
//    storage = "local-lvm"
//    size    = "8G"
//  }
//  ostemplate = "local:vztmpl/ubuntu-20.04-rootlogin_20.04-1_amd64.tar.gz"
//  password = "password"
//  target_node = "proxmox"
//  unprivileged = true
//  nameserver = "10.220.1.1"
//  searchdomain = "isactn.skyline.lan"
//  start = true
//}