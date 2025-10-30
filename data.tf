data "cloudflare_zones" "this" {
  count = var.domain != null ? 1 : 0
  name  = var.domain
}
