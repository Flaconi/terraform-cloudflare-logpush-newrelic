variable "name" {
  description = "The name of the job to create"
  type        = string
}

variable "newrelic_account_id" {
  description = "The NewRelic Account ID."
  type        = string
  sensitive   = true
}

variable "newrelic_api_key" {
  description = "The NewRelic API token."
  type        = string
  sensitive   = true
}

variable "domain" {
  description = "Cloudflare domain to fetch the zone id"
  type        = string
}

variable "dataset" {
  description = "The kind of the dataset"
  type        = string
  default     = "http_requests"
}

variable "enabled" {
  description = "Whether to enable the job"
  type        = bool
  default     = true
}

# https://developers.cloudflare.com/logs/logpush/logpush-job/filters/
variable "filter" {
  description = "Filter to include/exclude events"
  type        = map(any)
  default     = null
}

variable "kind" {
  description = "The kind of job to create"
  type        = string
  default     = null
}

variable "max_upload_bytes" {
  description = "The maximum uncompressed file size of a batch of logs"
  type        = number
  default     = 5000000
}

variable "max_upload_interval_seconds" {
  description = "The maximum interval in seconds for log batches"
  type        = number
  default     = 30
}

variable "max_upload_records" {
  description = "The maximum number of log lines per batch."
  type        = number
  default     = 1000
}

variable "output_options" {
  description = "Configuration string for requested fields and timestamp formats"
  type = object({
    batch_prefix     = optional(string)
    batch_suffix     = optional(string)
    cve_2021_44228   = optional(bool, false)
    field_delimiter  = optional(string)
    field_names      = optional(list(string))
    output_type      = optional(string, "ndjson")
    record_delimiter = optional(string)
    record_prefix    = optional(string)
    record_suffix    = optional(string)
    record_template  = optional(string)
    # Floating number to specify sampling rate. Sampling is applied on top of filtering, and regardless of the current sample_interval of the data
    sample_rate      = optional(number)
    timestamp_format = optional(string, "rfc3339")
  })
  default = {}
}

variable "destination" {
  description = "Destination specific settings"
  type = object({
    wait_before = optional(string)
    newrelic = optional(object({
      endpoint       = optional(string, "https://log-api.newrelic.com/log/v1")
      create_api_key = optional(bool, true)
      api_key        = optional(string)
    }), {})
  })
  default = {}
  validation {
    condition     = var.destination.newrelic.create_api_key == true || (var.destination.newrelic.create_api_key == false && length(compact([var.destination.newrelic.api_key, ""])) > 0)
    error_message = "Newrelic Api-Key is missing."
  }
}
