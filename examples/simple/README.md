# Example with no challenge created

Create a simple logpush job for newrelic

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 5.10 |
| <a name="requirement_newrelic"></a> [newrelic](#requirement\_newrelic) | ~> 3.69 |
| <a name="requirement_time"></a> [time](#requirement\_time) | ~> 0.13 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_example"></a> [example](#module\_example) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_token"></a> [token](#input\_token) | Cloudflare API token | `string` | n/a | yes |
| <a name="input_nr_acc_id"></a> [nr\_acc\_id](#input\_nr\_acc\_id) | The NewRelic Account ID. | `string` | n/a | yes |
| <a name="input_nr_token"></a> [nr\_token](#input\_nr\_token) | The NewRelic API token. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_job"></a> [job](#output\_job) | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

**[MIT License](LICENSE)**

Copyright (c) 2025 **[Flaconi GmbH](https://github.com/flaconi)**
