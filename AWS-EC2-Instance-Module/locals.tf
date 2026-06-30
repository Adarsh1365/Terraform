locals {
  common_tags = {
    Name        = "${var.project}-${var.environment}-${var.component}"
    Environment = var.environment
    Project     = var.project
    Component   = var.component
  }
}
