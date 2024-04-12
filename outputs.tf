output "logpush_job_id" {
  value       = cloudflare_logpush_job.this.id
  description = "The id of the created jogpush job"
}
