variable "create_sender" {
  description = "Indicates whether the user sender will be created or not"
  type = bool
}

variable "create_receiver" {
  description = "Indicates whether the user receiver will be created or not"
  type = bool
}

variable "sender_user_name" {
  description = "Name of the user sender if created."
  type = string
  default = ""
}

variable "receiver_user_name" {
    description = "Name of the user receiver if created."
    type = string
    default = ""
}

variable "enviroment" {
    description = "Indica o ambiente"
    type = string
}

variable "sender_user_arn" {
  description = "ARN of the sender user, used if create_sender is false."
  type        = string
  default     = ""
}

variable "receiver_user_arn" {
  description = "ARN of the receiver user, used if create_sender is false."
  type        = string
  default     = ""
}

variable "queue_name" {
  description = "Name of the queue to be created."
  type = string
}

variable "policy_sqs_name" {
    description = "Name of the policy to be created."
    type = string
  
}
