#variable "user_uuid" {
 # type        = string
  #description = "User UUID"
  #validation {
   # condition     = length(var.user_uuid) == 32 && can(regex("^[0-9a-fA-F]+$", var.user_uuid))
    #error_message = "User UUID must be a 32-character hexadecimal string."
  #}
#}