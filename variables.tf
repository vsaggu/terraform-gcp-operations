variable "random_suffix" {
  description = "Enables project random id generation. Mutually exclusive with project_id being non-empty."
  type        = bool
  default     = false
}

variable "org_id" {
  description = "The organization ID."
  type        = string
  default     = false
}

variable "project_name" {
  description = "The name for the project"
  type        = string
  default     = true
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
  type        = string
  default     = false
}

variable "environment" {
  description = "The developmnet environment that the project is in."
  type        = string
  default     = false
}

variable "troux_id" {
  description = "the troux id associated with the resource"
  type        = string
  default     = false
}

variable "cost_centre" {
  description = "The cost centre associated with the resource."
  type        = string
  default     = false
}

variable "activate_apis" {
  description = "The list of apis to activate within the project."
  type        = list(string)
  default     = ["compute.googleapis.com", "stackdriver.googleapis.com", "logging.googleapis.com", "monitoring.googleapis.com"]
}

variable "region" {
  description = "region of the resource"
  type        = string
  default     = false
}

variable "zone" {
  description = "zone of the resource"
  type        = string
  default     = false
}

variable "alert_name" {
  description = "Alerty Policy display name. Mandatory"
  type        = string
  default     = ""
}

variable "enabled" {
  description = "Use True or False to Enable / Disable Alert Policy"
  default     = "true"
}

variable "application_name" {
  description = "Application name as label"
  default     = ""
}

variable "comparison" {
  description = "The comparison to apply between the time series, only COMPARISON_LT and COMPARISON_GT are supported"
  default     = "COMPARISON_GT"
}

variable "duration" {
  description = "The amount of time that a time series must fail to report new data to be considered failing, only in multiples of 60s"
  default     = "300s"
}

variable "threshold_value" {
  description = "Threshold value for alerting"
  default     = "0"
}

variable "notification_id" {
  type    = list
  default = []
}

variable "logmetric_name" {
  description = "Logging Metric Name"
  type        = string
  default     = ""
}

variable "logmetric_filter" {
  description = "Filter for Logging Metric"
  type        = string
  default     = ""
}

variable "logmetric_metrickind" {
  description = "Metric Descriptor - metric_kind"
  type        = string
  default     = "DELTA"
}

variable "logmetric_valuetype" {
  description = "Metric Descriptor - value_type"
  type        = string
  default     = "INT64"
}

variable "predefined_filter" {
  description = "Use the Pre defined metric name from local_filters to use"
  default     = ""
}

variable "userdefined_filter" {
  description = "Resource Type"
  default     = ""
}

variable "documentation_content" {
  description = "Additional Email Content"
  default     = ""
}

variable "dashboard_json_filename" {
  description = "Json file having Dashboard & Charts data in JSON format"
  default     = "dashboard_json.json"
}
