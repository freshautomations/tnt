resource aws_route53_record dns {
  zone_id = "Z10EPHS50RAGD0"
  name    = "${var.TESTNET}${var.ID}"
  type    = "A"
  records = ["${aws_instance.node.public_ip}"]
  ttl     = 300
}

resource aws_instance node {
  ami                         = "ami-023b7b08f12db3191"
  instance_type               = "t2.xlarge"
  associate_public_ip_address = true
  key_name                    = "${var.KEY_NAME}"

  root_block_device {
    volume_size = 40
  }

  tags {
    Name        = "${var.TESTNET}${var.ID}"
    Environment = "${var.TESTNET}"
  }

  vpc_security_group_ids = ["${var.SEC_GROUP_ID}"]
}
