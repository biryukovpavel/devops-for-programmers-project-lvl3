terraform {
  backend "remote" {
    organization = "biryukovpy"

    workspaces {
      name = "devops-project-lvl3"
    }
  }
}
