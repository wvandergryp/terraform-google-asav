# Enable the Compute Engine API
# gcloud services enable compute.googleapis.com --project=YOUR_PROJECT_ID

# Enable the Secret Manager API
# gcloud services enable secretmanager.googleapis.com --project=YOUR_PROJECT_ID

# Define the Google Cloud provider and set the project and region
provider "google" {
  project = var.project
  region  = var.region
}

# Create a VPC network named inside_vpc without automatically created subnetworks
resource "google_compute_network" "inside_vpc" {
  name                    = var.inside_vpc_name
  auto_create_subnetworks = false
}

# Create a subnetwork inside_subnet within the inside_vpc network
resource "google_compute_subnetwork" "inside_subnet" {
  name          = var.inside_subnet_name
  ip_cidr_range = var.inside_subnet_cidr
  region        = var.region
  network       = google_compute_network.inside_vpc.id
}

# Create a VPC network named manage_vpc without automatically created subnetworks
resource "google_compute_network" "manage_vpc" {
  name                    = var.manage_vpc_name
  auto_create_subnetworks = false
}

# Create a subnetwork manage_subnet within the manage_vpc network
resource "google_compute_subnetwork" "manage_subnet" {
  name          = var.manage_subnet_name
  ip_cidr_range = var.manage_subnet_cidr
  region        = var.region
  network       = google_compute_network.manage_vpc.id
}

# Create a VPC network named outside_vpc without automatically created subnetworks
resource "google_compute_network" "outside_vpc" {
  name                    = var.outside_vpc_name
  auto_create_subnetworks = false
}

# Create a subnetwork outside_subnet within the outside_vpc network
resource "google_compute_subnetwork" "outside_subnet" {
  name          = var.outside_subnet_name
  ip_cidr_range = var.outside_subnet_cidr
  region        = var.region
  network       = google_compute_network.outside_vpc.id
}

# Define a module for deploying a Cisco ASAv VM
module "ciscoasav" {
  source         = "gehoumi/ciscoasav-vm/google"
  name           = var.asav_name
  project_id     = var.project
  subnetwork_names = {
    mgmt    = var.manage_subnet_name
    inside  = var.inside_subnet_name
    outside = var.outside_subnet_name
  }
  # Ensure the subnets are created before deploying the Cisco ASAv VM
  depends_on = [ google_compute_subnetwork.inside_subnet, google_compute_subnetwork.outside_subnet, google_compute_subnetwork.manage_subnet ] 
}