# google_sql_database.ecommerce:
resource "google_sql_database" "ecommerce" {
  charset   = "UTF8"
  collation = "en_US.UTF8"
  instance  = google_sql_database_instance.ecommerce.name
  name      = "ecommerce"
  project   = "ppds-apple"

  timeouts {}
}
resource "google_sql_user" "ecommerce" {
  name     = "ecommerce"
  instance = google_sql_database_instance.ecommerce.name
}
