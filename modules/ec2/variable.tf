variable "ec2_ami-id" {

  default = "ami-0a1b648e2cd533174"

}

variable "ec2_instance_type_master" {

  default = "t3.small"

}

variable "ec2_instance_type_slave" {

  default = "t2.micro"

}

variable "ec2_instance_type_nat" {

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
    master   = "B-Kube_Master"
    worker-1 = "B-Worker-1"
    worker-2 = "B-Worker-2"
    nat      = "B-Nat"
  }

}


variable "master_ip" {
  type    = string
  default = "192.168.2.10"

}

variable "nat_ip" {
  type    = string
  default = "192.168.2.5"

}

variable "worker-1_ip" {
  type    = string
  default = "192.168.2.21"

}

variable "worker-2_ip" {
  type    = string
  default = "192.168.2.22"

}

#NAT_Info

variable "nat_ami_id" {

  default = "ami-021413934953b89ef"

}

variable "nat_source" {

  default = "false"

}

variable "user_data_script_master" {
  type    = string
  default = <<-EOF
    #!/bin/bash

    sudo swapoff -a

    sudo apt-get update && echo | sudo apt-get  install awscli

    sudo apt-get install cron -y

    aws s3 cp s3://automation-ec2-v.2/pri.pem .

    aws s3 cp s3://automation-ec2-v.2/set_hostname.sh .

    aws s3 cp s3://automation-ec2-v.2/kubeadm.sh .

    aws s3 cp s3://automation-ec2-v.2/route53_record_entry.sh .

    aws s3 cp s3://automation-ec2-v.2/kube-flannel.yaml .

    aws s3 cp s3://automation-ec2-v.2/auto_crontab.sh .

    chmod +x *.sh

    bash kubeadm.sh
    
    bash set_hostname.sh

    bash route53_record_entry.sh

    bash auto_crontab.sh

    chmod 440 pri.pem

    sudo chown root:ubuntu pri.pem

    sudo mv /pri.pem /home/ubuntu/

    sudo mv /kube-flannel.yaml /home/ubuntu/

    sudo reboot

    


  EOF
}

variable "user_data_script_worker" {
  type    = string
  default = <<-EOF
    #!/bin/bash

    sudo swapoff -a

    sudo apt-get update && echo | sudo apt-get  install awscli

    aws s3 cp s3://automation-ec2-v.2/pri.pem .

    aws s3 cp s3://automation-ec2-v.2/set_hostname.sh .

    aws s3 cp s3://automation-ec2-v.2/kubeadm.sh .

    chmod +x *.sh

    bash kubeadm.sh
    
    bash set_hostname.sh

    chmod 440 pri.pem

    sudo chown root:ubuntu pri.pem

    sudo mv /pri.pem /home/ubuntu/

    sudo reboot

    


  EOF
}


