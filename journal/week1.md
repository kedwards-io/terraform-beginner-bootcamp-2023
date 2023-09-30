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

## Dealing with Configuration Drift

## What happens if we lose our state file?

If you lose your statefile, you most likely have to tear down all your cloud infrastructure manually.

You can use terraform import but it won't work for all cloud resources.  You need to check the terraform providers documenetation for whichj resources support it.

### Fix Missing Resources with Terraform Import

`terraform import aws_s3_bucket.example bucket-name`

[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)
[AWS S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

## Fix Manual Configuration

IF someone deletes or modifies cloud resources manually thour ClickOps, we can run Terraform plan to attempt to put our infrastructure back into the expect state fixing Configuration Drift.

## Fix using Terraform Refresh

```sh
terraform apply -refresh-only -autoapprove
```

## Terraform Modules

### Terraform Module Structure

It is recommended to plance modules in a `modules` directory when locally developing modules but you can name it whatever you like.

### Passing Input Variables

We can pass input variables to our module.

The moudule has to decare the terraform variables in its own variables.tf

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
}
```

### Modules Sources

Using the source we can import the module from various places eg:
- locally
- Gitbub
- Terraform Registry

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```
[Module Sources](https://developer.hashicorp.com/terraform/language/modules/sources)

