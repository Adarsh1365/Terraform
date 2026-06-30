locals {
  name="${var.project}-${var.environment}-${var.component}-sg"
  common_tags=merge(
    {
      "Name"="${var.project}-${var.environment}-${var.component}-sg"
      "Project"   = var.project
      "Env"       = var.environment
      "Component" = var.component
    },
    var.tags
  )
}