terraform {
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
  name            = var.project_name
  organization_id = var.org_id
  password        = var.db_password
  region          = "us-east-1"
}

resource "supabase_migration" "ledger_schema" {
  project_id = supabase_project.ledger.id
  name       = "init-ledger-schema"
  sql        = file("${path.module}/schema.sql")
}
