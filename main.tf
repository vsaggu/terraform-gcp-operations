provider "google" {
  project = "${var.project_name}"
}

locals {
  filters = {
    "compute_memory" = "metric.type=\"agent.googleapis.com/memory/percent_used\" AND resource.type=\"gce_instance\" AND metric.label.state=\"used\" AND metadata.user_labels.application=\"${var.application_name}\""
    "compute_cpu"    = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" AND resource.type=\"gce_instance\" AND metadata.user_labels.application=\"${var.application_name}\""
    "compute_disk"   = "metric.type=\"agent.googleapis.com/disk/percent_used\" AND resource.type=\"gce_instance\" AND metric.label.state=\"used\" AND metadata.user_labels.application=\"${var.application_name}\" "
    "compute_uptime" = "metric.type=\"compute.googleapis.com/instance/uptime\" AND resource.type=\"gce_instance\" AND metadata.user_labels.application=\"${var.application_name}\""
  }

  filter_names = {
    "compute_memory" = "Compute Memory Utilization"
    "compute_cpu"    = "Compute CPU Utilization"
    "compute_disk"   = "Compute Disk Space Utilization"
    "compute_uptime" = "Compute Uptime Check"
  }
}

resource "google_monitoring_alert_policy" "alert" {
  count        = "${var.alert_name != "" ? 1 : 0}"
  display_name = "${var.alert_name}"
  combiner     = "OR"
  enabled      = "${var.enabled}"

  notification_channels = ["${google_monitoring_notification_channel.notification_channel.*.id}"]

  conditions {
    # condition name
    display_name = "${var.alert_name}"

    # filter
    condition_threshold {
      filter = "${lookup(local.filters, var.predefined_filter, var.userdefined_filter)}"

      # threshold
      threshold_value = "${var.threshold_value}"

      # for
      duration = "${var.duration}"

      # above or below
      comparison = "${var.comparison}"
    }
  }

  #  depends_on = ["google_monitoring_notification_channel.notification_channel"]

  user_labels = {
    application = "${var.application_name}"
  }
  documentation {
    content = "${var.documentation_content}"
  }
}
