variable "token" {
  description = "Cloudflare API token"
  type        = string
}

variable "nr_acc_id" {
  description = "The NewRelic Account ID."
  type        = string
}

variable "nr_token" {
  description = "The NewRelic API token."
  type        = string
}

provider "cloudflare" {
  api_token = var.token
}

module "example" {
  source = "../../"

  enabled = false
  name    = "example-job"
  domain  = "example.com"
  dataset = "http_requests"

  output_options = {
    field_names = [
      "RayID",
      "ClientIP",
      "ClientRequestHost",
      "ClientRequestMethod",
      "ClientRequestURI",
      "EdgeResponseStatus",
      "EdgeResponseBytes",
      "EdgeStartTimestamp",
      "EdgeEndTimestamp"
    ]
  }

  newrelic_account_id = var.nr_acc_id
  newrelic_api_key    = var.nr_token
}

output "job" {
  value = module.example.job
}
