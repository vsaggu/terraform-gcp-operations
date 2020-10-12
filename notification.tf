resource "google_monitoring_notification_channel" "notification_channel" {
  count        = "${length(var.notification_id)}"
  enabled      = true
  display_name = "Send email to ${element(var.notification_id, count.index)}"
  type         = "email"

  labels = {
    email_address = "${element(var.notification_id, count.index)}"
  }
}
