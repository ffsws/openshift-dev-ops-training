variable "Type" {
  description = "Node types: EC2 instance types to use for different nodes"
  type = string
  default = "m5a.large"
}

variable "Zone" {
  type = string
  description = "Existing DNS zone to put openshift cluster in"
  default = "cc-openshift.de"
}

variable "Count" {
  description = "Nummer der Training Teilnehmer"
  type = string
  default = "4"
}
