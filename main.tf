resource "confluent_catalog_integration" "catalog_integrations" {
  for_each = var.catalog_integrations

  display_name = each.value.display_name

  environment {
    id = each.value.environment.id
  }

  kafka_cluster {
    id = each.value.kafka_cluster.id
  }

  dynamic "aws_glue" {
    for_each = each.value.aws_glue != null ? [each.value.aws_glue] : []
    content {
      custom_database         = aws_glue.value.custom_database
      provider_integration_id = aws_glue.value.provider_integration_id
    }
  }

  dynamic "biglake_metastore" {
    for_each = each.value.biglake_metastore != null ? [each.value.biglake_metastore] : []
    content {
      catalog_name            = biglake_metastore.value.catalog_name
      custom_namespace        = biglake_metastore.value.custom_namespace
      gcp_project_id          = biglake_metastore.value.gcp_project_id
      provider_integration_id = biglake_metastore.value.provider_integration_id
    }
  }

  dynamic "credentials" {
    for_each = each.value.credentials != null ? [each.value.credentials] : []
    content {
      key    = credentials.value.key
      secret = credentials.value.secret
    }
  }

  dynamic "snowflake" {
    for_each = each.value.snowflake != null ? [each.value.snowflake] : []
    content {
      allowed_scope    = snowflake.value.allowed_scope
      client_id        = snowflake.value.client_id
      client_secret    = snowflake.value.client_secret
      custom_namespace = snowflake.value.custom_namespace
      endpoint         = snowflake.value.endpoint
      warehouse        = snowflake.value.warehouse
    }
  }

  dynamic "unity" {
    for_each = each.value.unity != null ? [each.value.unity] : []
    content {
      catalog_name       = unity.value.catalog_name
      client_id          = unity.value.client_id
      client_secret      = unity.value.client_secret
      custom_schema      = unity.value.custom_schema
      workspace_endpoint = unity.value.workspace_endpoint
    }
  }
}

