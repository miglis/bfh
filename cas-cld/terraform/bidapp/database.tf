resource "google_sql_database_instance" "bid_db" {
  name             = "bid-db"
  database_version = "MYSQL_8_0"
  region           = var.region

  settings {
    tier              = "db-f1-micro"
    availability_type = "REGIONAL"

    backup_configuration {
      # Required for HA Setup
      binary_log_enabled = true
      enabled            = true
    }

    ip_configuration {
      ipv4_enabled = true
    }
  }

  root_password = data.google_secret_manager_secret_version.root_password.secret_data
}

resource "google_sql_database" "bidapp" {
  name     = "bidapp"
  instance = google_sql_database_instance.bid_db.name
}

resource "google_sql_user" "bidapp_user" {
  name     = "bidapp"
  instance = google_sql_database_instance.bid_db.name
  host     = "%"
  password = data.google_secret_manager_secret_version.bidapp_password.secret_data
}
