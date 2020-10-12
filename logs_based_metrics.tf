resource "google_logging_metric" "logging_metric" {
  count  = "${var.logmetric_name != "" ? 1 : 0}"
  name   = "${var.logmetric_name}"
  filter = "${var.logmetric_filter}"

  metric_descriptor {
    metric_kind = "${var.logmetric_metrickind}"
    value_type  = "${var.logmetric_valuetype}"
  }
}
