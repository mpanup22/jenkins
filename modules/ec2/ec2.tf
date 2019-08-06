
resource "aws_instance" "firstmachine"{

    ami= "${var.ami}"
    instance_type="${var.instance_type}"
    availability_zone = "${var.availability_zone}"
    key_name= "${var.key_name}"
    tags = {
    Name = "firsttag"
  }
    security_groups = [ "${aws_security_group.SG.name}"]
}
resource "aws_security_group" "SG" {
  name = "SG"
  ingress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
   }
 egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_volume_attachment" "ebs_att" {
device_name = "/dev/sdh"
volume_id = "${aws_ebs_volume.pract.id}"
instance_id = "${aws_instance.firstmachine.id}"
 }
data "aws_kms_key" "kmskey" {
  key_id = "alias/DEV_KMS_KEY"
  }

resource "aws_ebs_volume" "pract" {
  availability_zone = "us-east-2a"
  size              = 20

  tags = {
    Name = "ebs"
  }
  encrypted       = true
  kms_key_id = "${data.aws_kms_key.kmskey.arn}"
}
