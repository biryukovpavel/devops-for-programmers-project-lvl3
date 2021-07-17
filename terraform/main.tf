resource "digitalocean_ssh_key" "project_lvl3" {
  name       = "devops-project-lvl3"
  public_key = var.public_key
}

resource "digitalocean_droplet" "web" {
  count  = var.web.count
  image  = var.web.image
  name   = format("${var.web.name_prefix}-%02d", count.index + 1)
  region = var.region
  size   = var.web.size
  ssh_keys = [
    digitalocean_ssh_key.project_lvl3.fingerprint
  ]
}

resource "digitalocean_certificate" "cert" {
  name    = "domain-cert"
  type    = "lets_encrypt"
  domains = [digitalocean_domain.root.name, "${var.www_sub_domain_names}.${digitalocean_domain.root.name}"]
}

resource "digitalocean_loadbalancer" "public" {
  name   = var.loadbalancer_public.name
  region = var.region

  forwarding_rule {
    entry_port     = 443
    entry_protocol = "https"

    target_port     = var.loadbalancer_public.web_app_target_port
    target_protocol = "http"

    certificate_name = digitalocean_certificate.cert.name
  }

  healthcheck {
    port     = var.loadbalancer_public.web_app_target_port
    protocol = "http"
    path     = "/"
  }

  droplet_ids = digitalocean_droplet.web[*].id
}

resource "digitalocean_domain" "root" {
  name = var.root_domain_name
}

resource "digitalocean_database_cluster" "pg_project_lvl3" {
  name       = var.database.name
  engine     = "pg"
  version    = var.database.version
  size       = var.database.size
  region     = var.region
  node_count = var.database.node_count
}

resource "digitalocean_database_firewall" "trusted_web_sources" {
  cluster_id = digitalocean_database_cluster.pg_project_lvl3.id

  dynamic "rule" {
    for_each = digitalocean_droplet.web
    content {
      type  = "droplet"
      value = rule.value["id"]
    }
  }
}

resource "digitalocean_database_db" "redmine" {
  cluster_id = digitalocean_database_cluster.pg_project_lvl3.id
  name       = "redmine"
}

resource "digitalocean_database_user" "redmine" {
  cluster_id = digitalocean_database_cluster.pg_project_lvl3.id
  name       = "redmine"
}

resource "datadog_monitor" "redmine" {
  name    = "Hexlet devops-project-lvl3 HTTP Alert! {{host.name}}"
  type    = "service check"
  message = "Monitor triggered. Notify: @biryukovpyu@gmail.com"

  query = "\"http.can_connect\".over(\"instance:redmine_application_health_check_status\").by(\"host\",\"instance\",\"url\").last(2).count_by_status()"

  notify_no_data    = true
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 60
}
