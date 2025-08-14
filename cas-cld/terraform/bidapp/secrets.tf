resource "google_project_service" "secretmanager" {
  service  = "secretmanager.googleapis.com"
}

resource "google_secret_manager_secret" "root_password" {
  secret_id = "mysql-root-password"
  replication {
    auto {}
  }
  depends_on = [google_project_service.secretmanager]
}

resource "google_secret_manager_secret" "bidapp_password" {
  secret_id = "mysql-bidapp-password"
  replication {
    auto {}
  }
  depends_on = [google_project_service.secretmanager]
}

data "google_secret_manager_secret_version" "root_password" {
  secret  = google_secret_manager_secret.root_password.secret_id
  version = "latest"
}

data "google_secret_manager_secret_version" "bidapp_password" {
  secret  = google_secret_manager_secret.bidapp_password.secret_id
  version = "latest"
}
