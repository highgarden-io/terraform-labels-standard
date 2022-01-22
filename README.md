
# terraform-labels-generator

Terraform module designed to generate consistent names and tags for resources. Use `terraform-labels-generator` to implement a strict naming convention.

[![Generate terraform docs](https://github.com/highgarden-io/terraform-labels-standard/actions/workflows/documentation.yaml/badge.svg)](https://github.com/highgarden-io/terraform-labels-standard/actions/workflows/documentation.yaml) [![Lint](https://github.com/highgarden-io/terraform-labels-standard/actions/workflows/lint.yaml/badge.svg)](https://github.com/highgarden-io/terraform-labels-standard/actions/workflows/lint.yaml)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_id_component"></a> [id\_component](#input\_id\_component) | Sub-component of the resources, used to generate resource ID. (default to empty string) | `string` | `""` | no |
| <a name="input_id_layer"></a> [id\_layer](#input\_id\_layer) | Infrastructure layer of the resources, used to generate resource ID. | `string` | n/a | yes |
| <a name="input_id_name"></a> [id\_name](#input\_id\_name) | Name of the resources, used to generate resource ID. | `string` | n/a | yes |
| <a name="input_id_namespace"></a> [id\_namespace](#input\_id\_namespace) | Namespace of generate resources, used to group resources of a team/sub-organization. | `string` | `"main"` | no |
| <a name="input_id_org_name"></a> [id\_org\_name](#input\_id\_org\_name) | The Organization Name | `string` | `"highgarden"` | no |
| <a name="input_id_org_name_short"></a> [id\_org\_name\_short](#input\_id\_org\_name\_short) | Short Organization Name used for naming resources. | `string` | `"h8n"` | no |
| <a name="input_id_org_name_tld"></a> [id\_org\_name\_tld](#input\_id\_org\_name\_tld) | Organization TLD used to generate standard labels keys. | `string` | `"io"` | no |
| <a name="input_id_stage"></a> [id\_stage](#input\_id\_stage) | Stage of the resources, such as dev, test, prod, etc. | `string` | n/a | yes |
| <a name="input_managed_by"></a> [managed\_by](#input\_managed\_by) | Name of the component that manages the resources. ( default to 'Terraform', possible values can be other IAC Tools if not managed by Terraform) | `string` | `"terraform"` | no |
| <a name="input_managed_by_ref"></a> [managed\_by\_ref](#input\_managed\_by\_ref) | Reference of the location of the component that manages the resources. (Repo / Terraform State Path) | `string` | n/a | yes |
| <a name="input_topology_region"></a> [topology\_region](#input\_topology\_region) | Region of the resources, used to generate resource ID. | `string` | n/a | yes |
| <a name="input_topology_zone"></a> [topology\_zone](#input\_topology\_zone) | Zone of the resources if applicable. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the resource |
<!-- END_TF_DOCS -->

# License
[MIT License](https://raw.githubusercontent.com/highgarden-io/terraform-labels-generator/master/LICENSE)

# Contribution

PR(s) are Open and Welcomed.