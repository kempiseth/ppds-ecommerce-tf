# google_compute_instance.ecommerce:
resource "google_compute_instance" "ecommerce" {
  depends_on = [
    google_compute_instance.nodejs,
    google_sql_database_instance.ecommerce
  ]

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false
  guest_accelerator   = []
  labels              = {}
  machine_type        = "e2-micro"
  metadata            = {}
  name                = "ecommerce"
  project             = "ppds-apple"
  resource_policies   = []
  tags = [
    "http-server",
    "https-server",
  ]
  zone = "asia-southeast1-c"

  boot_disk {
    auto_delete = true
    device_name = "ecommerce"
    mode        = "READ_WRITE"
    source      = "https://www.googleapis.com/compute/v1/projects/ppds-apple/zones/asia-southeast1-c/disks/ecommerce"
  }

  confidential_instance_config {
    enable_confidential_compute = false
  }

  network_interface {
    network            = "https://www.googleapis.com/compute/v1/projects/ppds-apple/global/networks/default"
    network_ip         = "10.148.0.3"
    subnetwork         = "https://www.googleapis.com/compute/v1/projects/ppds-apple/regions/asia-southeast1/subnetworks/default"
    subnetwork_project = "ppds-apple"

    access_config {
      nat_ip       = "35.240.197.237"
      network_tier = "PREMIUM"
    }
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
  }

  service_account {
    email = "948472938217-compute@developer.gserviceaccount.com"
    scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
    ]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  timeouts {}
}
