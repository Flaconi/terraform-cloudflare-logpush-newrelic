data "cloudflare_zone" "this" {
  name = var.domain
}
