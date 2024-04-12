terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.20"
    }
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 3.34"
    }
    time = {
      source = "hashicorp/time"
      version = "~> 0.11"
    }
  }
  required_version = "~> 1.3"
}
