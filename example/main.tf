provider "aws" {
  region = "eu-west-1"
}

module "lightsail" {
  source               = "../"
  environment          = "test"
  name                 = "lightsail"
  label_order          = ["name", "environment"]
  public_key           = "ssh-rsa xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx= vinod@vinod"
  use_default_key_pair = true
  user_data            = file("${path.module}/lightsail.sh")

  port_info = [
    {
      port     = 80
      protocol = "tcp"
      cidrs    = ["0.0.0.0/0"]
    },
    {
      port     = 22
      protocol = "tcp"
      cidrs    = ["0.0.0.0/0"]
    }
  ]
}
