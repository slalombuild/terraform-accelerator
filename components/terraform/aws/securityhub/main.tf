module "securityhub" {
  source = "cloudposse/security-hub/aws"
  # Cloud Posse recommends pinning every module to a specific version
  version = "0.10.0"

  enabled_standards = var.enabled_standards
  create_sns_topic  = var.create_sns_topic

  context = module.this.context
}