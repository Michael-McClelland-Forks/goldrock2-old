locals {
  organization = {
    # accounts = [
    #   {
    #     name  = "Default"
    #     key   = "goldrock-default"
    #     email = "root@company.com"
    #   }
    # ]
    units = [
      {
        name = "security",
        key  = "goldrock-security"
        accounts = [
          {
            name  = "securityservices"
            key   = "goldrock-securityservices"
            email = "mccmcc+securityservices@amazon.com"
          }
        ]
        units = [
          {
            name = "forensics",
            key  = "goldrock-security-forensics"
            # accounts = [
            #   {
            #     name  = "Blue"
            #     key   = "goldrock-myproduct-development-blue"
            #     email = "development@company.com"
            #   }
            # ]
          },
          {
            name = "teneble",
            key  = "goldrock-security-teneble"
            # accounts = [
            #   {
            #     name  = "Blue"
            #     key   = "goldrock-myproduct-production-blue"
            #     email = "production@company.com"
            #   }
            # ]
          }
        ]
      },
      {
        name = "infrastructure",
        key  = "goldrock-infrastructure"
        units = [
          {
            name = "development",
            key  = "goldrock-infrastructure-development"
            # accounts = [
            #   {
            #     name  = "Blue"
            #     key   = "goldrock-myproduct-development-blue"
            #     email = "development@company.com"
            #   }
            # ]
          },
          {
            name = "testing",
            key  = "goldrock-infrastructure-testing"
            # accounts = [
            #   {
            #     name  = "Blue"
            #     key   = "goldrock-myproduct-production-blue"
            #     email = "production@company.com"
            #   }
            # ]
          },
          {
            name = "production",
            key  = "goldrock-infrastructure-production"
            # accounts = [
            #   {
            #     name  = "Blue"
            #     key   = "goldrock-myproduct-production-blue"
            #     email = "production@company.com"
            #   }
            # ]
          }
        ]
      }
    ]
  }
}

module "organization_structure" {
  source = "./module"

  organization = local.organization
}

terraform {
  backend "s3" {
  }
}
