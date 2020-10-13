resource "google_monitoring_notification_channel" "notification_channel" {
  count        = "${length(var.notification_id)}"
  display_name = "${var.notification_id[count.index]}"
  type         = "email"

  labels = {
    email_address = "${var.notification_id[count.index]}"
  }
}
