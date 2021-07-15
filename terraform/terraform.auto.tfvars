public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCw8bITsddcfLWe36bs/fyiV0NfnhVOgXh7aUE/SFnUhrnpJ+nZ/ok/8IBI8aWMRZ5FRf56wEVIVpmXQpu7KCOWl1j4Ltp4gsIxpxeocnkwX8o/UOXnd1HQBw5tJGiQRDFsoV2Arm5pmxuITwkevDYACfPa/Jjwg38gs8wzgLkG8VegbmKLykvfau2Cf/29J0rpp5Amlnq73RvsHwkUnluAf8Vbp3MF5aG+HmG9Y9M/EX3KRGOlWcr/FPXkTfPBTA2xjzsZEh1VUMoMGUdjlnaD1oifmOZaedouOEXtjZVWrJ4+nbia4J5a+PPfAID5/vqlf43CWrQ8ZCmCje4bYxuAf920vZXmPCcSM7spbkqqiMcJiZsSPlYwcvHplSBc/pQLfH/JYUeqkcQbMSsrAEi/GYhaOWajHNLZqf1koJ+ziHjjdIyfNayp1yU7tvpNzuJVE+f+W4YJZVKf1f59s9o3ZHXjWNCn/9CwyxFXwmw5M8/uBKDLqOuR37m2mzwa1jXsOf+z0fob5VXCdn+TzOthhJW9M/NgpIhkgJ8lIi6j/COeSuPugIfSIrk8HvB61ykvgKGIjz0utJNt2YaTc/462d4PmaYx3nABT3Rb0OomLV56KtVGd5MKKWxsYjhsBqqj1f4zi0ibNDEx5CfRA2fukxVCrA6CYUmKuQ/gyCN/5w== root@project-lvl3"

web = {
  image       = "docker-20-04"
  name_prefix = "project-lvl3"
  size        = "s-1vcpu-1gb"
  count       = 2
}

loadbalancer_public = {
  name                = "lb-project-lvl3"
  web_app_target_port = 3000
}

database = {
  name       = "pg-project-lvl3"
  version    = "13"
  size       = "db-s-1vcpu-1gb"
  node_count = 1
}
