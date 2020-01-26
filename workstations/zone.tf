resource "aws_route53_record" "workstation-record" {
  zone_id = data.aws_route53_zone.existing-zone.zone_id
  name    = "workstation${count.index + 1}.${data.aws_route53_zone.existing-zone.name}"
  type = "A"

  count = var.Count

  ttl = "300"
  records = [aws_instance.workstation.*.public_ip[count.index]]
}
