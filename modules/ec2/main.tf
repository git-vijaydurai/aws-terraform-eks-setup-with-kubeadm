#Node_Master_info

resource "aws_instance" "master_ec2" {


  ami                         = var.ec2_ami-id
  subnet_id                   = var.subnet_1-id
  private_ip                  = var.master_ip
  instance_type               = var.ec2_instance_type_master
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = [var.security_group]
  user_data                   = var.user_data_script_master
  iam_instance_profile        = "admin"

  tags = {
    Name = "${var.instance_name["master"]}"
  }

}

#Nat_info

resource "aws_instance" "nat_ec2" {


  ami                         = var.nat_ami_id
  subnet_id                   = var.subnet_1-id
  private_ip                  = var.nat_ip
  instance_type               = var.ec2_instance_type_nat
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  source_dest_check           = var.nat_source
  vpc_security_group_ids      = [var.security_group]

  tags = {
    Name = "${var.instance_name["nat"]}"
  }

}


#Node_Worker-1_info 

resource "aws_instance" "worker-1_ec2" {


  ami                    = var.ec2_ami-id
  subnet_id              = var.subnet_2-id
  private_ip             = var.worker-1_ip
  instance_type          = var.ec2_instance_type_slave
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group]
  user_data              = var.user_data_script_worker
  iam_instance_profile   = "admin"

  tags = {
    Name = "${var.instance_name["worker-1"]}"
  }

}

#Node_Worker-2_info 

resource "aws_instance" "woker-2_ec2" {


  ami                    = var.ec2_ami-id
  subnet_id              = var.subnet_2-id
  private_ip             = var.worker-2_ip
  instance_type          = var.ec2_instance_type_slave
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group]
  user_data              = var.user_data_script_worker
  iam_instance_profile   = "admin"

  tags = {
    Name = "${var.instance_name["worker-2"]}"
  }

}

