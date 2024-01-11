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