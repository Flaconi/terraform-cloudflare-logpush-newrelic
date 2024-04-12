variable "api_token" {
  description = "The Cloudflare API token."
  type        = string
}

variable "newrelic_account_id" {
  description = "The NewRelic Account ID."
  type        = string
}

variable "newrelic_api_key" {
  description = "The NewRelic API token."
  type        = string
}

variable "job_name" {
  description = "The name of the job to create"
  type        = string
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

variable "filter" {
  description = "Filter to include/exclude events"
  type        = map(any)
  default     = {}
}

variable "frequency" {
  description = "Frequency of logs being pushed"
  type        = string
  default     = "high"
}

variable "kind" {
  description = "The kind of job to create"
  type        = string
  default     = ""
}

variable "logpull_options" {
  description = "Configuration string for requested fields and timestamp formats"
  type        = string
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
  validation {
    condition     = var.destination.newrelic.create_api_key == true || (var.destination.newrelic.create_api_key == false && length(compact([var.destination.newrelic.api_key, ""])) > 0)
    error_message = "Newrelic Api-Key is missing."
  }
}
