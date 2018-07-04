

provider "google" {
  credentials = ""
  project     = "avinashgcp"
   region      = "us-east1"
}


resource "google_compute_instance" "avish-tf" {
  machine_type = "n1-standard-1"
  name         = "avish-tf"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-8"
    }
  }
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
      nat_ip = "${google_compute_address.avish-gcp-ip.address}"
    }
  }
}

resource "google_compute_address" "avish-gcp-ip" {
  name = "avish-gcp-ip"
}






provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
}
resource "aws_instance" "avish-tf" {
  ami   = "ami-2757f631"
  instance_type = "t2.micro"
}

resource "aws_eip" "avish-aws-ip" {
  instance = "${aws_instance.avish-tf.id}"
}
