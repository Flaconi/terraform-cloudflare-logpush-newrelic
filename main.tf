resource "newrelic_api_access_key" "this" {
  count       = var.destination.newrelic.create_api_key ? 1 : 0
  account_id  = var.newrelic_account_id
  key_type    = "INGEST"
  ingest_type = "LICENSE"
  name        = "Cloudflare logpush key for ${var.name}"
  notes       = "The key used for pushing logs from Cloudflare"
}


# Waits before the creation of the logpush job in order
# to give time to propagate the created pre-resources (i.e Newrelic api-key)
resource "time_sleep" "cloudflare_logpush_job_before" {
  count           = var.destination.wait_before != null ? 1 : 0
  create_duration = var.destination.wait_before
}

resource "cloudflare_logpush_job" "this" {
  enabled                     = var.enabled
  dataset                     = var.dataset
  destination_conf            = local.destination_conf
  filter                      = var.filter != null ? jsonencode(var.filter) : null
  kind                        = var.kind
  max_upload_bytes            = var.max_upload_bytes
  max_upload_interval_seconds = var.max_upload_interval_seconds
  max_upload_records          = var.max_upload_records
  name                        = var.name
  output_options              = local.output_options
  account_id                  = var.account_id
  zone_id                     = var.domain != null ? lookup(data.cloudflare_zones.this[0].result[0], "id") : null
  depends_on                  = [time_sleep.cloudflare_logpush_job_before]

  lifecycle {
    precondition {
      condition     = var.domain != null || var.account_id != null
      error_message = "Domain or account_id must be provided."
    }
  }
}
