provider "aws" {
  region = "eu-west-1"
}

module "lightsail" {
  source               = "../"
  environment          = "test"
  name                 = "lightsail"
  label_order          = ["name", "environment"]
  public_key           = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCudIC/l8ZCHUMv44k0eLjG6Dy3ByAIcwXN0acQ2RzzNTY/VnTut5UXlADEv8QErytuf5Q5sMmxJIEaqXeX+A2DskmZ9SizshU0nx95T52UU+7DF6zesFeWf2OhxP+J8XIHgnpBkBIglydRR8hUOktz0fqemUdRJ6nkpQzsfVnCOn1WF5eazJxHYQHmABrOy371Cxbm11dMXqiWvg+hrnUxl1rwRwClBaOjlp3vVmpcnkpdp4mC7WGiT/UZpc+NK4S3Kc2GwkHvcGANllsyJSSb34JPFnoWgJ4YKLwxtaWkLW3dnIhDrhARE7TcdW+OxiIgsl88TMyAMESr9FdO7G7ysdTLzKP6IPoTxmDJI+OT6QJLIh3KqmVrQlEHlnP8QeOMrF65bUjmg+ZgkCq1J8o/5hAKRvBfm2Mq+3lFB8h3v/7dpceRrzzajpMTYlJFHBcZ4Gl6mUl/4KZDhlicv8vAw5jSomYZ3tlnvapF1/YcQJzRGOP+JJTOVr1VV+FQEn8= vinod@vinod"
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
