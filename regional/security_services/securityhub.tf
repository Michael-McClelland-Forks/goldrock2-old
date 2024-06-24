resource "aws_securityhub_finding_aggregator" "aws_securityhub_finding_aggregator" {
  linking_mode = "ALL_REGIONS"
}

resource "aws_securityhub_organization_configuration" "aws_securityhub_organization_configuration" {
  auto_enable           = false
  auto_enable_standards = "NONE"
  organization_configuration {
    configuration_type = "CENTRAL"
  }

  depends_on = [
    aws_securityhub_finding_aggregator.aws_securityhub_finding_aggregator
  ]
}

# resource "aws_securityhub_configuration_policy" "example" {
#   name        = "Example"
#   description = "This is an example configuration policy"

#   configuration_policy {
#     service_enabled = true
#     enabled_standard_arns = [
#       "arn:aws:securityhub:us-east-1::standards/aws-foundational-security-best-practices/v/1.0.0",
#       "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0",
#     ]
#     security_controls_configuration {
#       disabled_control_identifiers = []
#     }
#   }

#   depends_on = [aws_securityhub_organization_configuration.example]
# }

# resource "aws_securityhub_configuration_policy_association" "root_example" {
#   target_id = "r-abcd"
#   policy_id = aws_securityhub_configuration_policy.example.id
# }