terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.10"
    }
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 3.69"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.13"
    }
  }
  required_version = "~> 1.3"
}
