# google_sql_database_instance.ecommerce:
resource "google_sql_database_instance" "ecommerce" {
  database_version    = "POSTGRES_12"
  deletion_protection = true
  name                = "ecommerce"
  project             = "ppds-apple"
  region              = "asia-southeast1"

  settings {
    activation_policy           = "ALWAYS"
    availability_type           = "ZONAL"
    disk_autoresize             = false
    disk_size                   = 10
    disk_type                   = "PD_HDD"
    pricing_plan                = "PER_USE"
    tier                        = "db-custom-1-3840"
    user_labels                 = {}

    backup_configuration {
      binary_log_enabled             = false
      enabled                        = true
      location                       = "asia-southeast1"
      point_in_time_recovery_enabled = true
      start_time                     = "16:00"
    }

    ip_configuration {
      ipv4_enabled = true
      require_ssl  = false

      authorized_networks {
        value = "0.0.0.0/0"
      }
    }

    location_preference {
      zone = "asia-southeast1-c"
    }

    maintenance_window {
      day  = 7
      hour = 17
    }
  }

  timeouts {}
}
