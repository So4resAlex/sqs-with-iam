### Terraform SQS module


To-do

- [ ] Config pre-commit ci 
- [ ] Create a README with usage example

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.5
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.37.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.37.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam"></a> [iam](#module\_iam) | git::git@github.com:So4resAlex/sqs-with-iam.git//iam | develop |
| <a name="module_sqs"></a> [sqs](#module\_sqs) | git::git@github.com:So4resAlex/sqs-with-iam.git//sqs | develop |

## Resources

| Name | Type |
|------|------|
| [aws_sqs_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enviroment"></a> [enviroment](#input\_enviroment) | Enviroment | `string` | n/a | yes |
| <a name="input_policy_sqs_name"></a> [policy\_sqs\_name](#input\_policy\_sqs\_name) | The name from policy queue | `string` | n/a | yes |
| <a name="input_queue_name"></a> [queue\_name](#input\_queue\_name) | The name from queue to be created | `string` | n/a | yes |
| <a name="input_receiver_user_arn"></a> [receiver\_user\_arn](#input\_receiver\_user\_arn) | The receiver user from queue | `string` | n/a | yes |
| <a name="input_sender_user_arn"></a> [sender\_user\_arn](#input\_sender\_user\_arn) | The sender user from queue | `string` | n/a | yes |
<!-- END_TF_DOCS --