variable "REGION" {
  default = "us-east-2"
}

variable "AMIS" {
  type = map
  default = {
    us-east-2a = "ami-0b7fce1abbd71db35"
    us-east-2b = "ami-0b7fce1abbd798b35"
  }
}

variable "PRIV_KEY" {
  default = "projkey"
}

variable "PUB_KEY" {
  default = "projkey.pub"
}

variable "USER" {
  default = "ubuntu"
}

variable "MYIP" {
  default = "183.83.39.124/32"
}

variable "VPC_NAME" {
  default = "proj-vpc"
}

variable "rmquser" {
  default = "projrmq"
}

variable "rmqpass" {
  default = "ashsatsan1278@"
}

variable "dbname" {
  default = "accounts"
}

variable "dbuser" {
  default = "admin"
}

variable "dbpass" {
  default = "admin123"
}

variable "vpcCIDR" {
  default = "172.21.0.0/16"
}

variable "CIDR_PUB1" {
  default = "172.21.1.0/24"
}

variable "CIDR_PUB2" {
  default = "172.21.2.0/24"
}

variable "CIDR_PUB3" {
  default = "172.21.3.0/24"
}

variable "CIDR_PRIV1" {
  default = "172.21.4.0/24"
}

variable "CIDR_PRIV2" {
  default = "172.21.5.0/24"
}

variable "CIDR_PRIV3" {
  default = "172.21.6.0/24"
}

variable "ZONE1" {
  default = "us-east-2a"
}

variable "ZONE2" {
  default = "us-east-2b"
}

variable "ZONE3" {
  default = "us-east-2c"
}

variable "instance_count" {
  default = 1  # no quotes, since it's a number
}
