output "job" {
  description = "A created logpush job"
  value = { for k, v in cloudflare_logpush_job.this :
    k => v if !contains(["ownership_challenge", "last_complete"], k)
  }
}
