output "web_ip_addresses" {
  value = digitalocean_droplet.web[*].ipv4_address
}

output "pg_database" {
  value     = digitalocean_database_cluster.pg_project_lvl3
  sensitive = true
}
