terraform {
  cloud {
  }
  required_providers {
    supabase = {
      source  = "supabase/supabase"
      version = "1.5.1"
    }
  }
}

provider "supabase" {
  access_token = var.supabase_access_token
}

resource "supabase_project" "ledger" {
  name              = var.project_name
  organization_id   = var.org_id
  database_password = var.db_password
  region            = "us-east-1"
}
