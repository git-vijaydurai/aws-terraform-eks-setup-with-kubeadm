variable "vpc_name" {
  type    = string
  default = "kube_adm_vpc"
}

variable "kube_adm_vpc_cidr" {
  default = "192.168.2.0/24"

}

variable "subnet-01_cidr" {
  default = "192.168.2.0/28"

}

variable "subnet-02_cidr" {
  default = "192.168.2.16/28"
}

variable "subnet-01_name" {
  type    = string
  default = "subnet-01"
}

variable "subnet-02_name" {
  type    = string
  default = "subnet-02"
}

variable "az_zone_a" {
  type    = string
  default = "ap-south-1a"
}

variable "az_zone_b" {
  type    = string
  default = "ap-south-1b"
}

variable "kube-adm_igw-name" {
  type    = string
  default = "kube-adm_igw"
}

variable "cidr_open" {
  default = "0.0.0.0/0"
}

variable "routetable_name" {
  type    = string
  default = "route-table"

}


