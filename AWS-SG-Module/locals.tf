locals {
  name="${var.project}-${var.environment}-${var.sg_name}"
  common_tags=merge(
    {
      "Name"="${var.project}-${var.environment}-${var.sg_name}"
      "Project"   = var.project
      "Env"       = var.environment
      "SG_Name" = var.sg_name
    },
    var.tags
  )
}