# resource "google_compute_instance" "default" {
#   name         = "sandbox1"
#   machine_type = "n1-standard-1"
#   zone         = "europe-west2-c"

#   tags = ["foo", "bar"]

#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-11"
#       labels = {
#         my_label = "value"
#       }
#     }
#   }

#   // Local SSD disk
# #   scratch_disk {
# #     interface = "SCSI"
# #   }

#   network_interface {
#     network = "default"

#     access_config {
#       // Ephemeral public IP
#     }
#   }

#   metadata = {
#     foo = "bar"
#   }

#   metadata_startup_script = "echo hi > /test.txt"

#   service_account {
#     email  = var.service_account
#     scopes = ["cloud-platform"]
#   }

#   resource_policies = [google_compute_resource_policy.daily.id]
# }

terraform {
  backend "gcs" {
    bucket  = "sandboxtfstate"
    prefix  = "sanboxpolicy"
  }
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