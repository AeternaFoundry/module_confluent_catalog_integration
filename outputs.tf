output "catalog_integrations_id" {
  description = "Map of id values across all catalog_integrations, keyed the same as var.catalog_integrations except keys with no id are omitted"
  value       = { for k, v in confluent_catalog_integration.catalog_integrations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "catalog_integrations_aws_glue" {
  description = "Map of aws_glue values across all catalog_integrations, keyed the same as var.catalog_integrations except keys with no aws_glue are omitted"
  value       = { for k, v in confluent_catalog_integration.catalog_integrations : k => one(v.aws_glue) if v.aws_glue != null && length(v.aws_glue) > 0 }
}
output "catalog_integrations_biglake_metastore" {
  description = "Map of biglake_metastore values across all catalog_integrations, keyed the same as var.catalog_integrations except keys with no biglake_metastore are omitted"
  value       = { for k, v in confluent_catalog_integration.catalog_integrations : k => one(v.biglake_metastore) if v.biglake_metastore != null && length(v.biglake_metastore) > 0 }
}
output "catalog_integrations_credentials" {
  description = "Map of credentials values across all catalog_integrations, keyed the same as var.catalog_integrations except keys with no credentials are omitted"
  value       = { for k, v in confluent_catalog_integration.catalog_integrations : k => one(v.credentials) if v.credentials != null && length(v.credentials) > 0 }
  sensitive   = true
}
output "catalog_integrations_display_name" {
  description = "Map of display_name values across all catalog_integrations, keyed the same as var.catalog_integrations except keys with no display_name are omitted"
  value       = { for k, v in confluent_catalog_integration.catalog_integrations : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "catalog_integrations_environment" {
  description = "Map of environment values across all catalog_integrations, keyed the same as var.catalog_integrations except keys with no environment are omitted"
  value       = { for k, v in confluent_catalog_integration.catalog_integrations : k => one(v.environment) if v.environment != null && length(v.environment) > 0 }
}
output "catalog_integrations_kafka_cluster" {
  description = "Map of kafka_cluster values across all catalog_integrations, keyed the same as var.catalog_integrations except keys with no kafka_cluster are omitted"
  value       = { for k, v in confluent_catalog_integration.catalog_integrations : k => one(v.kafka_cluster) if v.kafka_cluster != null && length(v.kafka_cluster) > 0 }
}
output "catalog_integrations_snowflake" {
  description = "Map of snowflake values across all catalog_integrations, keyed the same as var.catalog_integrations except keys with no snowflake are omitted"
  value       = { for k, v in confluent_catalog_integration.catalog_integrations : k => one(v.snowflake) if v.snowflake != null && length(v.snowflake) > 0 }
  sensitive   = true
}
output "catalog_integrations_suspended" {
  description = "Map of suspended values across all catalog_integrations, keyed the same as var.catalog_integrations except keys with no suspended are omitted"
  value       = { for k, v in confluent_catalog_integration.catalog_integrations : k => v.suspended if v.suspended != null }
}
output "catalog_integrations_unity" {
  description = "Map of unity values across all catalog_integrations, keyed the same as var.catalog_integrations except keys with no unity are omitted"
  value       = { for k, v in confluent_catalog_integration.catalog_integrations : k => one(v.unity) if v.unity != null && length(v.unity) > 0 }
  sensitive   = true
}

