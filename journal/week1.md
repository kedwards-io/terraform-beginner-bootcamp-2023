# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

Our root module structure is as follows:

```
  PROJECT_ROOT
  ├── main.tf             # everything else
  ├── variables.tf        # stores the structure of input variables
  ├── terraform.tfvars    # the data of variables we want to load into our terraform project
  ├── providers.tf        # defined required providers and their configuration
  ├── outputs.tf          # stores our outputs
  └── README.md           # required for root modules
```
  
[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables

### Terraform Cloud Variables

In Terraform we can set two kinds of vaiables:
- Environment Variables - those that you would set in your bash terminal eg. AWS credentials
- Terraform Variables - those that you would normally set in your tfvars file

We can set Terraform Cloud variables to be sensitive so they are not shown visibly in the UI.

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)
### var flag
We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_uuid="my_user_id"`

### var-file flag

To set lots of variables, you can specify their values in a variable definitions file (with a filename ending in either .tfvars or .tfvars.json) and then specify that file on the command line with -var-file: `terraform apply -var-file="testing.tfvars"`

### terraform.tvfars

This is the default file to laod in terraform variable in bulk

### auto.tfvars

When using Terraform Cloud, the workspace settings in Terraform cloud replace the use of CLI-provided variables files. For each Terraform Cloud workspace you can configure workspace variables.

### order of terraform variables

Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

- Environment variables
- The terraform.tfvars file, if present.
- The terraform.tfvars.json file, if present.
- Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
- Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)
