# data "template_file" "dashboard_json" {
#   template = "${file(var.dashboard_json_filename)}"
# }

# resource "google_monitoring_dashboard" "dashboard" {
#   project        = var.project_name
#   dashboard_json = "${data.template_file.dashboard_json.rendered}"
# }
