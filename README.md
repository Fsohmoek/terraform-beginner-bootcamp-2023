# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project is going utilize semantic versioning for its tagging. ![semver.org](https://semver.org/)

The general format:

 **MAJOR.MINOR.PATCH**, eg. `1.0.1``

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes
Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

## Install the Terraform CLI

### Consideration with the Terraform CLI changes

The Terraform CLI installation instructions have changed due to gpg keyring changes. So we needed refer to the lastest install CLI instructions via Terraform Documentation and change the scripting for install.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Refactoring into bash scripts

While fixing the Terraform CLI gpg depreciation issues we notice that bash scripts steps were a considerable amount more code. So we decided to create a bash script to install the Terraform CLI.

This bash script is located here: [./bin/install_terraform_cli](./bin/install_terraform_cli)

- This will keep the Gitpod Task File ([.gitpod.yml](.gitpod.yml)) tidy.
- This allow us an easier to debug and execute manually Terraform CLI install.
- This will allow better portability for other projects that need to install Terraform CLI.

### GitHub Lifecycle (Before, Init, Command)

We need to be careful when using the Init because it will not return if we restart an existing workspace.

### working Env Vars

#### env command

We can list out all Environment Variables (Env Vars) using the `env` command

We can filter specific Env Vars using `grep``

#### Setting and Unsetting Env Vars

In the terminal we can set using `export HELLO='world'`

In the terminal we can unset using `unset HELLO`

We can set an env vars temporally when just running a command

```sh
HELLO='world' ./bin/print_message
```

Within a bash script we can set env without writing export eg.

```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```
#### Printing Vars

We can print an env using echo eg. `echo $HELLO`

#### Scoping of Env Vars

When you open up new bash terminal in VScode it will not be aware of env vars that you have set in another window.

If you want to env vars to persist across all future bash terminals that are open you need to set env vars in your bash profile. eg. `.bash_profile``

#### Persisting env vars in gitpod

We can persist env vars into gitpod by storing them in gitpod secrets storage.

```
gp env HELLO='world'
```
All future workspaces launched will set the env vars for all bash terminals opened in those workspaces

You can also set en vars in the `gitpod.yml` 

### AWS CLI Installation

AWS CLI is installed for this project via the bash script [`.bin/install_aws_cli``](./bin/install_aws_cli)

[Getting Started Install (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

We can check if our AWS credentials is configured correctly by running the following AWS CLI command:

```sh
aws sts get-caller-identity
```

If it is successful you should see a json payload return that look like this:

```json
{
    "UserId": "AI2AZQSDPXZ64SRTJDB",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/terraform-beginner-bootcamp"
}
```

We'll need to generate AWS CLI credits from IAM User in order to the user AWS CLI

## TERRAFORM BASICS

### TERRAFORM REGISTRY

Terraform sources their providers and modules from Terraform Registry which located at [registry.terraform.io](https://registry.terraform.io/)

- **Providers** is an interface to APIs that allow to create resources in Terraform
    [Random Terraform Provider](https://registry.terraform.io/providers/hashicorp/random)
- **Modules** are a way to make large amount of terraform code moduloar, portable and sharable

### TERRAFORM CONSOLE

We can see a list of all the terraform commands by simply typing `terraform``

#### TERRAFORM INIT

At the start of a new terraform project we will run `terraform init` to download the binaries for the terraform providers that we'll use in this project.

#### TERRAFORM PLAN
`terraform plan` 

This will generate out a changeset, about the state of our infrstructure and what will be changed.

We can output this changeset  ie. "plan" to be passed to an apply, but often you can just ignore outputting

#### TERRAFORM APPLY
`terraform apply`

This will run a plan and pass the changeset to be execute by terraform. Apply should prompt yes or no 

If we want to automatically approve an apply we can provide flag eg. `terraform apply --auto-approve`

#### TERRAFORM DETROY

This will destroy resources.

You can also use the auto approve flag to skip the approve prompt, eg. `terraform destroy --auto-approve`

### TERRAFORM LOCK FILES

`.terraform.lock.hcl` contains the locked versioning for the providers or modules that should be used with this project

The terraform Lock >file **should be commited** to your Version Control System (VCS) eg. GitHub

### TERRAFORM STATE FILES

`terraform.tfstate` contain information about the current state of your infrastructure.

This file **should not be commited** to your VCS

This file can contain sensentive data.

If you lose this file you lose knowning the state of your infrastructure.

`.terraform.tfstate.backup` is the previous state file state.

### TERRAFORM DIRECTORY

`terraform` directory contains binairies of terraform providers.