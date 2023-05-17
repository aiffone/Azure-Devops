terraform {
  backend "gcs" {
    bucket  = "sandboxstate"
    prefix  = "sanboxpolicy"
  }
}

