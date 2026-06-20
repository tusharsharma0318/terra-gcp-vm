resource "google_compute_network" "vpc_network" {
  name                    = var.vpcname
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnetname
  ip_cidr_range = "10.1.0.0/24"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_firewall" "allow-ssh" {
  name    = var.firewallrule1
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20"]
}

resource "google_compute_firewall" "allow-http" {
  name    = var.firewallrule2
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_router" "router" {
  name    = var.routername
  network = google_compute_network.vpc_network.id
}

resource "google_compute_router_nat" "nat" {
  name                               = var.cloudnatname
  router                             = google_compute_router.router.name
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_instance" "VM" {
  name         = var.vmname
  machine_type = var.vmmachinetype
  zone         = var.vmmachinezone

  boot_disk {
    initialize_params {
      image = var.vmimage
      size  = var.vmsize
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.subnet.id
  }

  metadata_startup_script = file("apache.sh")
}


