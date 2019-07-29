module "ec2" {
  source = "../../modules/ec2"
  
  region    = "${var.region}"
  access_key = ""
  secret_key = ""
  availability_zone = "${var.availability_zone}"
  ami= "${var.ami}"
  instance_type="${var.instance_type}"
  key_name= "${var.key_name}"
  
 
 }
 module "kms" {
   source = "../../modules/kms"
  

}
 module "ebs" {
   source = "../../modules/ebs"
   ami= "${var.ami}"
  }


 
