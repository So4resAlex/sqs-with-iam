variable "create_sender" {
  description = "Indica se o user sender sera criado ou não"
  type = bool
}

variable "create_receiver" {
  description = "Indica se o user sender sera criado ou não"
}

variable "sender_user_name" {
  description = "Nome do user sender caso seja criado"
}

variable "receiver_user_name" {
  
}

variable "enviroment" {
    description = "Indica o ambiente"
    type = string
}

variable "sender_user_arn" {
  description = "ARN do usuário sender, usado se create_sender for false."
  type        = string
  default     = ""
}

variable "receiver_user_arn" {
  description = "ARN do usuário receiver, usado se create_receiver for false."
  type        = string
  default     = ""
}

variable "queue_name" {
  description = "Queue name"
  type = string
}

variable "policy_sqs_name" {
    description = "Terraform policy"
    type = string
  
}
