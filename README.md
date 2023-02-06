# terraform-example

This repo is my own implementation of the architecture found on [Terraform: Up & Running](https://www.terraformupandrunning.com/). 
I made changes based on my own ideas and personal experience working with Terraform. 

This repo leverages [Terragrunt](https://terragrunt.gruntwork.io/) to avoid code repetition, and to create a multi-environment configuration 
that is maintainable, and not too cumbersome or difficult to understand.

The code is divided in `live` and `modules` directories. The ideal structure would be to keep them in separate repositories
so that the code found in `modules` can be versioned and pulled by the `live` repository.  However, for simplicity I will keep
them together in this repo.

## Architecture

This is a simple example that serves an API server on an Auto-Scaling group, and uses RDS for a postgresql database with a Redis cluster for caching frequently accessed data. The implementation details are left out since this is an architecture exercise.

![image](https://user-images.githubusercontent.com/19579265/217070205-7897e5e5-fd09-4430-9fcf-38d3c0ccaf8f.png)


## Usage
For deploying the infrastructure found in this repo:

1. Install [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/)
2. Install the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions) and setup your account
3. Clone this repository
3. Run `cd live && terragrunt run-all apply --terragrunt-source ~/repo-location/modules`
