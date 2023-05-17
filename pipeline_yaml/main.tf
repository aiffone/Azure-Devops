provider "google" {
  project     = var.gcp_project
  region      = var.gcp_region
  zone        = var.zone
}

resource "google_compute_resource_policy" "daily" {
  name   = "gce-sandbox-policy"
  region = "europe-west2"
  description = "Start and stop instances"
  instance_schedule_policy {
    vm_start_schedule {
      schedule = "0 9 * * 1-5"
    }
    vm_stop_schedule {
      schedule = "0 18 * * 1-5"
    }
    time_zone = "Greenwich"
  }
}