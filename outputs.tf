output "alert_policy_name" {
  description = " Name of the Alert Policy"
  value       = "${join("", compact(google_monitoring_alert_policy.alert.*.name))}"
}
