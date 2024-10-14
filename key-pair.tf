resource "aws_key_pair" "projkey" {
  key_name = "projkey"
  public_key = file(var.PUB_KEY)
}