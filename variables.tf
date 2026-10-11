variable "catalog_integrations" {
  description = <<EOT
Map of catalog_integrations, attributes below
Required:
    - display_name
    - environment (block):
        - id (required)
    - kafka_cluster (block):
        - id (required)
Optional:
    - aws_glue (block):
        - custom_database (optional)
        - provider_integration_id (required)
    - biglake_metastore (block):
        - catalog_name (required)
        - custom_namespace (optional)
        - gcp_project_id (required)
        - provider_integration_id (required)
    - credentials (block):
        - key (required)
        - secret (required)
    - snowflake (block):
        - allowed_scope (required)
        - client_id (required)
        - client_secret (required)
        - custom_namespace (optional)
        - endpoint (required)
        - warehouse (required)
    - unity (block):
        - catalog_name (required)
        - client_id (required)
        - client_secret (required)
        - custom_schema (optional)
        - workspace_endpoint (required)
EOT

  type = map(object({
    display_name = string
    environment = object({
      id = string
    })
    kafka_cluster = object({
      id = string
    })
    aws_glue = optional(object({
      custom_database         = optional(string)
      provider_integration_id = string
    }))
    biglake_metastore = optional(object({
      catalog_name            = string
      custom_namespace        = optional(string)
      gcp_project_id          = string
      provider_integration_id = string
    }))
    credentials = optional(object({
      key    = string
      secret = string
    }))
    snowflake = optional(object({
      allowed_scope    = string
      client_id        = string
      client_secret    = string
      custom_namespace = optional(string)
      endpoint         = string
      warehouse        = string
    }))
    unity = optional(object({
      catalog_name       = string
      client_id          = string
      client_secret      = string
      custom_schema      = optional(string)
      workspace_endpoint = string
    }))
  }))
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

