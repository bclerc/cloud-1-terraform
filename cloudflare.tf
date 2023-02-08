resource "cloudflare_record" "updatedns" {
  depends_on = [
    aws_instance.linux
  ]
  zone_id = var.cloudflare_zone_id
  name    = var.dns_zone
  value   =  aws_instance.linux.public_ip
  type    = "A"
  ttl     = 1
  proxied = true
}

output "public_ip" {
  value = aws_instance.linux.public_ip
}

output "final_dns" {
  value = cloudflare_record.updatedns.name
}