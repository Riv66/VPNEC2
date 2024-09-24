
resource "aws_instance" "MyPrivateEC2Server" {
  ami           = aws_ami_from_instance.example.id
  instance_type = "t2.micro"
subnet_id = data.aws_subnets.prisublist.ids[1]
  key_name               = var.keyp
  vpc_security_group_ids = ["${aws_security_group.priSG.id}"]
 tags = {
    tier    = "Private"
    name = "${var.tags["owner"]}-Appserver"
    owner   = var.tags["owner"]
    service = var.tags["service"]
  }
  depends_on = [
    aws_ami_from_instance.example
  ]
}

output "AppServer_ip_addr" {
  value = aws_instance.MyPrivateEC2Server.private_ip
}