<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.37.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.37.0 |


## Resources

| Name | Type |
|------|------|
| [aws_iam_user.receiver](https://registry.terraform.io/providers/hashicorp/aws/5.37.0/docs/resources/iam_user) | resource |
| [aws_iam_user.sender](https://registry.terraform.io/providers/hashicorp/aws/5.37.0/docs/resources/iam_user) | resource |
| [aws_sqs_queue.terraform_queue](https://registry.terraform.io/providers/hashicorp/aws/5.37.0/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_policy.terraform_queue_policy](https://registry.terraform.io/providers/hashicorp/aws/5.37.0/docs/resources/sqs_queue_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_receiver"></a> [create\_receiver](#input\_create\_receiver) | Indicates whether the user receiver will be created or not | `bool` | n/a | yes |
| <a name="input_create_sender"></a> [create\_sender](#input\_create\_sender) | Indicates whether the user sender will be created or not | `bool` | n/a | yes |
| <a name="input_enviroment"></a> [enviroment](#input\_enviroment) | Indica o ambiente | `string` | n/a | yes |
| <a name="input_policy_sqs_name"></a> [policy\_sqs\_name](#input\_policy\_sqs\_name) | Name of the policy to be created. | `string` | n/a | yes |
| <a name="input_queue_name"></a> [queue\_name](#input\_queue\_name) | Name of the queue to be created. | `string` | n/a | yes |
| <a name="input_receiver_user_arn"></a> [receiver\_user\_arn](#input\_receiver\_user\_arn) | ARN of the receiver user, used if create\_sender is false. | `string` | `""` | no |
| <a name="input_receiver_user_name"></a> [receiver\_user\_name](#input\_receiver\_user\_name) | Name of the user receiver if created. | `string` | `""` | no |
| <a name="input_sender_user_arn"></a> [sender\_user\_arn](#input\_sender\_user\_arn) | ARN of the sender user, used if create\_sender is false. | `string` | `""` | no |
| <a name="input_sender_user_name"></a> [sender\_user\_name](#input\_sender\_user\_name) | Name of the user sender if created. | `string` | `""` | no |

## Usage

 1. Update the file ``/env/backend_s3_devops.hcl`` with your bucket's details.

 2. Create a file named ``main.tf`` and add the following content.

````hcl
terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.37.0"
    }   
  }
  backend "s3" {} #Init with -backend-config parameter 
}
provider "aws" {
  region = "us-east-1"
}


module "sqs_and_iam" {
  source = "git::git@github.com:So4resAlex/sqs-with-iam.git" 

  create_sender   = false
  create_receiver = false
  queue_name      = "DevOps-Queue"
  sender_user_name   = "Sender_user"
  receiver_user_name = "Receiver_user"
  policy_sqs_name = "SQS-DevOps-Policy"
  enviroment = "DevOps"
  sender_user_arn    = "" # If create_sender is true, no input is needed.
  receiver_user_arn  = "" # If create_receiver is true, no input is needed.
}
````
3. Initialize the Terraform project using the command below.
``terraform init -backend-config="env/backend_s3_devops.hcl"``
4. Generate the execution plan using the command below.
``terraform plan -out plano``
5. Apply the execution plan with the command below.
``terraform apply plan``


<!-- END_TF_DOCS -->