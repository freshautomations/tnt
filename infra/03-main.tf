provider "aws" {
  region = "us-east-1"
}

#terraform {
#  backend "s3" {}
#}

resource aws_security_group testnet_sec_group {
  name        = "${var.TESTNET}"
  description = "${var.TESTNET} network security group"

  tags {
    Environment = "${var.TESTNET}"
  }

  ingress {
    from_port   = 22
    to_port     = 22
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
    from_port   = 1317
    to_port     = 1317
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 26656
    to_port     = 26657
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource aws_key_pair key {
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDY1d1L3iKHbv1Ivn2zYxdmaohSFwHb4l1lUp+yso1fhvRxJ0NqxLM34vmyRvwNwbukdRSiC84QbQ9Bxl4TuU3H+Gbxs1xfhVIhyRrHwEp8hp6U1pfuG29NtzUwViRxvHKv/HF7sLcA/1ks9ZD0prqP6UkDkivcrlV4iXVEcRCsuhoWYqnOiq93SPTMY5S0CA1jt69+zz07K+QN/TUrgua3TROlWksdGuv35zcf7TIWZIkEElK7HCe6EnhLq3hEe5XgqGIuzDMh/D1rPZ5mBq+YPc1x9f+Y+NPm08UD1WS3OJzPNvHYHYwx6mVnrlwN3AyK5+d7wsSv6fNA2vGqAz/5 AutoTestNet"
  key_name   = "${var.TESTNET}"
}

module "node0" {
  source       = "node"
  TESTNET      = "${var.TESTNET}"
  ID           = 0
  SEC_GROUP_ID = "${aws_security_group.testnet_sec_group.id}"
  KEY_NAME     = "${aws_key_pair.key.key_name}"
}

module "node1" {
  source       = "node"
  TESTNET      = "${var.TESTNET}"
  ID           = 1
  SEC_GROUP_ID = "${aws_security_group.testnet_sec_group.id}"
  KEY_NAME     = "${aws_key_pair.key.key_name}"
}

module "node2" {
  source       = "node"
  TESTNET      = "${var.TESTNET}"
  ID           = 2
  SEC_GROUP_ID = "${aws_security_group.testnet_sec_group.id}"
  KEY_NAME     = "${aws_key_pair.key.key_name}"
}

module "node3" {
  source       = "node"
  TESTNET      = "${var.TESTNET}"
  ID           = 3
  SEC_GROUP_ID = "${aws_security_group.testnet_sec_group.id}"
  KEY_NAME     = "${aws_key_pair.key.key_name}"
}
