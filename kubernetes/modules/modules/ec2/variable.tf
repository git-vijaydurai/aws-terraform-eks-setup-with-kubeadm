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

    sudo apt-get update && echo | sudo apt-get  install awscli

    aws s3 cp s3://automation-ec2-v.1/set_hostname.sh .

    aws s3 cp s3://automation-ec2-v.1/kubeadm.sh .

    aws s3 cp s3://automation-ec2-v.1/route53_record_entry.sh .

    chmod +x *.sh

    bash kubeadm.sh
    
    bash set_hostname.sh

    bash route53_record_entry.sh

    sudo reboot

    


  EOF
}
