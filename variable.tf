variable "vpcname" {
  type    = string
  default = "terraform-vpc-1"
}

variable "subnetname" {
  type    = string
  default = "test-subnet-1"
}

variable "firewallrule1" {
  type    = string
  default = "terra-firewall-1"
}

variable "firewallrule2" {
  type    = string
  default = "terra-firewall-2"
}

variable "routername" {
  type    = string
  default = "terra-router-1"
}

variable "cloudnatname" {
  type    = string
  default = "terra-cloudnat-1"
}


variable "vmname" {
  type    = string
  default = "my-terra-instance1"
}

variable "vmmachinetype" {
  type    = string
  default = "e2-micro"
}

variable "vmmachinezone" {
  type    = string
  default = "us-east4-a"
}

variable "vmimage" {
  type    = string
  default = "ubuntu-minimal-2204-jammy-v20260530"
}

variable "vmsize" {
  type    = string
  default = 15
}
