locals {
  destination_conf = format(
    "%s?Api-Key=%s&format=cloudflare",
    var.destination.newrelic.endpoint,
  var.destination.newrelic.create_api_key ? newrelic_api_access_key.this[0].key : var.destination.newrelic.api_key)
}
