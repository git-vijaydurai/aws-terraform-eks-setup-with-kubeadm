variable "ec2_ami-id" {

  default = "ami-0a7cf821b91bcccbc"

}

variable "ec2_instance_type_master" {

  default = "t3.small"

}

variable "ec2_instance_type_slave" {

  default = "t2.micro"

}


variable "key_name" {

  default = "raju_mum"

}

variable "subnet_1-id" {}

variable "subnet_2-id" {}

variable "associate_public_ip_address" {

  default = "true"

}

variable "security_group" {}



variable "instance_name" {
  type        = map(any)
  description = "This all instace's name"
  default = {
    master   = "Kube_Master"
    worker-1 = "Worker-1"
    worker-2 = "Worker-2"
  }

}


variable "master_ip" {
  type    = string
  default = "192.168.2.10"

}

variable "worker-1_ip" {
  type    = string
  default = "192.168.2.11"

}

variable "worker-2_ip" {
  type    = string
  default = "192.168.2.12"

}



variable "user_data_script" {
  type    = string
  default = <<-EOF
    #!/bin/bash

    sudo apt-get update && sudo apt-get install -y apt-transport-https curl

    sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

    echo | sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

    sudo apt-get update && sudo apt-get install -y kubelet=1.20.0-00 kubeadm=1.20.0-00 kubectl=1.20.0-00 docker.io

    sudo systemctl start docker && sudo systemctl enable docker



  EOF
}
