terraform {
  backend "gcs" {
    bucket  = "sandboxstate"
    prefix  = "terraform/state"
  }
}

