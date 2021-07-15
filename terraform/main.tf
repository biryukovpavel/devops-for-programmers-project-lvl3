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
