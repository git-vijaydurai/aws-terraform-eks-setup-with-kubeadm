resource "aws_security_group" "sg" {

  name = var.sg_name

  vpc_id = var.vpc-id

  description = "kube_adm_sg"

  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = -1
    protocol    = "icmp"
    to_port     = -1
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1            # -1 indicates all protocols
    cidr_blocks = ["0.0.0.0/0"] # Allow traffic from all sources
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1            # -1 indicates all protocols
    cidr_blocks = ["0.0.0.0/0"] # Allow traffic to all destinations
  }


  tags = {

    Name = var.sg_name
  }
}
